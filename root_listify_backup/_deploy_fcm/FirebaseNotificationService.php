<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;

/**
 * Professional Web Push via FCM HTTP v1.
 *
 * Strategy:
 * - Hybrid: webpush.notification (OS toast when backgrounded) + data (foreground showNotification).
 * - PNG icon only — SVG favicons cause Chrome showNotification to fail silently.
 * - Multi-device via fcm_tokens (+ legacy users.fcm_token).
 * - Desktop: Windows Action Center / Chrome corner toast.
 * - Mobile Chrome: notification shade (iOS Safari needs installed PWA).
 */
class FirebaseNotificationService
{
    public function sendToUser(int $userId, string $title, string $body, array $data = []): bool
    {
        try {
            if (!$this->isEnabled()) {
                Log::info('FCM skip: firebase disabled', ['user_id' => $userId]);

                return false;
            }

            $tokens = $this->tokensForUser($userId);
            if (empty($tokens)) {
                Log::info('FCM skip: no tokens for user', ['user_id' => $userId]);

                return false;
            }

            $sent = 0;
            foreach ($tokens as $token) {
                if ($this->sendToToken($token, $title, $body, $data)) {
                    $sent++;
                }
            }

            Log::info('FCM sendToUser summary', [
                'user_id' => $userId,
                'devices' => count($tokens),
                'sent_ok' => $sent,
            ]);

            return $sent > 0;
        } catch (\Throwable $e) {
            Log::warning('FCM sendToUser failed: ' . $e->getMessage(), [
                'user_id' => $userId,
            ]);

            return false;
        }
    }

    public function sendToToken(string $token, string $title, string $body, array $data = []): bool
    {
        try {
            if (!$this->isEnabled() || $token === '') {
                return false;
            }

            $accessToken = $this->getAccessToken();
            $projectId = config('services.firebase.project_id');
            if (!$accessToken || !$projectId) {
                return false;
            }

            $click = (string) ($data['click_action'] ?? url('/agent/appointment'));
            // Same path as SW file on live docroot (must be PNG — SVG fails silently)
            $icon = url('/fcm-notification-icon.png');
            $tag = 'listify-enquiry-' . (string) ($data['appointment_id'] ?? time());

            $stringData = [
                'title' => $title,
                'body' => $body,
                'click_action' => $click,
                'icon' => $icon,
            ];
            foreach ($data as $key => $value) {
                $stringData[(string) $key] = is_scalar($value) || $value === null
                    ? (string) $value
                    : json_encode($value);
            }

            // Hybrid: webpush.notification = OS toast when tab/browser backgrounded.
            // data = same fields for foreground onMessage → showNotification.
            // PNG icon required (SVG breaks Chrome showNotification silently).
            $payload = [
                'message' => [
                    'token' => $token,
                    'data' => $stringData,
                    'webpush' => [
                        'headers' => [
                            'Urgency' => 'high',
                            'TTL' => '86400',
                        ],
                        'notification' => [
                            'title' => $title,
                            'body' => $body,
                            'icon' => $icon,
                            'badge' => $icon,
                            'requireInteraction' => true,
                            'renotify' => true,
                            'tag' => $tag,
                        ],
                        'fcm_options' => [
                            'link' => $click,
                        ],
                    ],
                ],
            ];

            $response = Http::withToken($accessToken)
                ->acceptJson()
                ->timeout(15)
                ->post(
                    "https://fcm.googleapis.com/v1/projects/{$projectId}/messages:send",
                    $payload
                );

            if (!$response->successful()) {
                Log::warning('FCM API error', [
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);

                if (in_array($response->status(), [404, 400], true)) {
                    $this->forgetToken($token);
                }

                return false;
            }

            return true;
        } catch (\Throwable $e) {
            Log::warning('FCM sendToToken failed: ' . $e->getMessage());

            return false;
        }
    }

    public function isEnabled(): bool
    {
        $credentials = config('services.firebase.credentials');

        if (!(bool) config('services.firebase.enabled')
            || empty(config('services.firebase.project_id'))
            || empty(config('services.firebase.vapid_key'))
            || empty($credentials)
            || !is_readable($credentials)
        ) {
            return false;
        }

        $json = json_decode((string) file_get_contents($credentials), true);

        return is_array($json)
            && (($json['type'] ?? '') === 'service_account')
            && !empty($json['client_email'])
            && !empty($json['private_key']);
    }

    protected function tokensForUser(int $userId): array
    {
        $tokens = [];

        if (Schema::hasTable('fcm_tokens')) {
            $tokens = DB::table('fcm_tokens')
                ->where('user_id', $userId)
                ->pluck('token')
                ->filter()
                ->unique()
                ->values()
                ->all();
        }

        if (Schema::hasColumn('users', 'fcm_token')) {
            $legacy = DB::table('users')->where('id', $userId)->value('fcm_token');
            if (!empty($legacy)) {
                $tokens[] = $legacy;
            }
        }

        return array_values(array_unique(array_filter($tokens)));
    }

    protected function forgetToken(string $token): void
    {
        if (Schema::hasColumn('users', 'fcm_token')) {
            DB::table('users')->where('fcm_token', $token)->update(['fcm_token' => null]);
        }
        if (Schema::hasTable('fcm_tokens')) {
            DB::table('fcm_tokens')->where('token', $token)->delete();
        }
    }

    protected function getAccessToken(): ?string
    {
        return Cache::remember('firebase_fcm_access_token', 3000, function () {
            $path = config('services.firebase.credentials');
            if (!$path || !is_readable($path)) {
                Log::warning('Firebase credentials file missing or unreadable.');

                return null;
            }

            $credentials = json_decode((string) file_get_contents($path), true);
            if (empty($credentials['client_email']) || empty($credentials['private_key'])) {
                Log::warning('Firebase credentials JSON is invalid.');

                return null;
            }

            $now = time();
            $header = $this->base64UrlEncode(json_encode(['alg' => 'RS256', 'typ' => 'JWT']));
            $claims = $this->base64UrlEncode(json_encode([
                'iss' => $credentials['client_email'],
                'scope' => 'https://www.googleapis.com/auth/firebase.messaging',
                'aud' => 'https://oauth2.googleapis.com/token',
                'iat' => $now,
                'exp' => $now + 3600,
            ]));

            $unsigned = $header . '.' . $claims;
            $signature = '';
            if (!openssl_sign($unsigned, $signature, $credentials['private_key'], OPENSSL_ALGO_SHA256)) {
                Log::warning('Failed to sign Firebase JWT.');

                return null;
            }

            $jwt = $unsigned . '.' . $this->base64UrlEncode($signature);
            $response = Http::asForm()
                ->timeout(15)
                ->post('https://oauth2.googleapis.com/token', [
                    'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
                    'assertion' => $jwt,
                ]);

            if (!$response->successful() || empty($response->json('access_token'))) {
                Log::warning('Firebase OAuth token exchange failed', [
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);

                return null;
            }

            return $response->json('access_token');
        });
    }

    protected function base64UrlEncode(string $data): string
    {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }
}
