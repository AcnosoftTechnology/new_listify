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

            $devices = $this->devicesForUser($userId);
            if (empty($devices)) {
                Log::info('FCM skip: no tokens for user', ['user_id' => $userId]);

                return false;
            }

            $sent = 0;
            foreach ($devices as $device) {
                if ($this->sendToToken(
                    $device['token'],
                    $title,
                    $body,
                    $data,
                    $device['platform']
                )) {
                    $sent++;
                }
            }

            Log::info('FCM sendToUser summary', [
                'user_id' => $userId,
                'devices' => count($devices),
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

    /**
     * Notify the other party when a chat message is sent (customer ↔ vendor).
     */
    public function notifyChatMessage(int $senderId, int $receiverId, string $messageText, string $threadCode): bool
    {
        try {
            if ($senderId <= 0 || $receiverId <= 0 || $senderId === $receiverId) {
                return false;
            }

            $sender = DB::table('users')->where('id', $senderId)->first();
            $receiver = DB::table('users')->where('id', $receiverId)->first();
            if (!$receiver) {
                return false;
            }

            $senderName = trim((string) ($sender->name ?? '')) ?: 'Someone';
            $body = trim($messageText);
            if (mb_strlen($body) > 120) {
                $body = mb_substr($body, 0, 117) . '...';
            }

            $isAgent = (int) ($receiver->is_agent ?? 0) === 1 || (int) ($receiver->role ?? 0) === 2;
            $prefix = $isAgent ? 'agent' : 'customer';
            // Relative path — SW resolves with live origin (avoids wrong APP_URL → homepage)
            $click = "/{$prefix}/messages/{$senderId}/{$threadCode}";

            Log::info('FCM chat notify', [
                'sender_id' => $senderId,
                'receiver_id' => $receiverId,
                'thread' => $threadCode,
                'receiver_is_agent' => $isAgent,
                'click' => $click,
            ]);

            $ok = $this->sendToUser(
                $receiverId,
                'New message from ' . $senderName,
                $body !== '' ? $body : 'You have a new message.',
                [
                    'type' => 'chat',
                    'thread_code' => $threadCode,
                    'sender_id' => (string) $senderId,
                    'url_prefix' => $prefix,
                    'click_action' => $click,
                ]
            );

            if (!$ok) {
                Log::warning('FCM chat notify: no delivery (missing token or FCM error)', [
                    'receiver_id' => $receiverId,
                ]);
            }

            return $ok;
        } catch (\Throwable $e) {
            Log::warning('FCM chat notify failed: ' . $e->getMessage(), [
                'sender_id' => $senderId,
                'receiver_id' => $receiverId,
            ]);

            return false;
        }
    }

    public function sendToToken(string $token, string $title, string $body, array $data = [], string $platform = 'web'): bool
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

            $platform = strtolower($platform ?: 'web');
            if (!in_array($platform, ['web', 'android', 'ios'], true)) {
                $platform = 'web';
            }

            $click = (string) ($data['click_action'] ?? '/agent/appointment');
            $clickPath = $this->toSitePath($click);
            $clickAbsolute = $this->toAbsoluteUrl($clickPath);
            $icon = $this->toAbsoluteUrl('/fcm-notification-icon.png');

            $stringData = [
                'title' => $title,
                'body' => $body,
                'click_action' => $clickPath,
                'icon' => $icon,
            ];
            foreach ($data as $key => $value) {
                if ($key === 'click_action') {
                    continue;
                }
                $stringData[(string) $key] = is_scalar($value) || $value === null
                    ? (string) $value
                    : json_encode($value);
            }

            $message = [
                'token' => $token,
                'data' => $stringData,
            ];

            if ($platform === 'web') {
                // Data-only + webpush — browser SW shows system toast (avoids duplicate)
                $message['webpush'] = [
                    'headers' => [
                        'Urgency' => 'high',
                        'TTL' => '86400',
                    ],
                    'fcm_options' => [
                        'link' => $clickAbsolute,
                    ],
                ];
            } elseif ($platform === 'android') {
                $message['android'] = [
                    'priority' => 'high',
                    'notification' => [
                        'title' => $title,
                        'body' => $body,
                        'sound' => 'default',
                        'click_action' => $clickPath,
                        'channel_id' => 'listify_default',
                    ],
                ];
            } else { // ios
                $message['apns'] = [
                    'headers' => [
                        'apns-priority' => '10',
                    ],
                    'payload' => [
                        'aps' => [
                            'alert' => [
                                'title' => $title,
                                'body' => $body,
                            ],
                            'sound' => 'default',
                            'badge' => 1,
                        ],
                        'click_action' => $clickPath,
                    ],
                ];
            }

            $payload = ['message' => $message];

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
                    'platform' => $platform,
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

    /**
     * @return array<int, array{token: string, platform: string}>
     */
    protected function devicesForUser(int $userId): array
    {
        $devices = [];

        if (Schema::hasTable('fcm_tokens')) {
            $rows = DB::table('fcm_tokens')->where('user_id', $userId)->get();
            foreach ($rows as $row) {
                $token = trim((string) ($row->token ?? ''));
                if ($token === '') {
                    continue;
                }
                $platform = 'web';
                if (isset($row->platform) && $row->platform !== '') {
                    $platform = strtolower((string) $row->platform);
                }
                $devices[$token] = [
                    'token' => $token,
                    'platform' => in_array($platform, ['web', 'android', 'ios'], true) ? $platform : 'web',
                ];
            }
        }

        // Legacy column only when multi-device table has nothing
        if (empty($devices) && Schema::hasColumn('users', 'fcm_token')) {
            $legacy = DB::table('users')->where('id', $userId)->value('fcm_token');
            if (!empty($legacy)) {
                $token = trim((string) $legacy);
                $devices[$token] = [
                    'token' => $token,
                    'platform' => 'web',
                ];
            }
        }

        return array_values($devices);
    }

    /** @deprecated use devicesForUser */
    protected function tokensForUser(int $userId): array
    {
        return array_column($this->devicesForUser($userId), 'token');
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

    protected function toSitePath(string $urlOrPath): string
    {
        $urlOrPath = trim($urlOrPath);
        if ($urlOrPath === '') {
            return '/agent/appointment';
        }

        if (preg_match('#^https?://#i', $urlOrPath)) {
            $parts = parse_url($urlOrPath);
            $path = $parts['path'] ?? '/';
            if (!empty($parts['query'])) {
                $path .= '?' . $parts['query'];
            }

            return $path === '' ? '/' : $path;
        }

        return str_starts_with($urlOrPath, '/') ? $urlOrPath : '/' . $urlOrPath;
    }

    protected function toAbsoluteUrl(string $path): string
    {
        $path = $this->toSitePath($path);

        try {
            if (!app()->runningInConsole() && request() && request()->getHttpHost()) {
                return rtrim(request()->getSchemeAndHttpHost(), '/') . $path;
            }
        } catch (\Throwable $e) {
            // fall through
        }

        $appUrl = rtrim((string) config('app.url'), '/');
        // Prefer production host if APP_URL still points at localhost
        if ($appUrl === '' || str_contains($appUrl, 'localhost') || str_contains($appUrl, '127.0.0.1')) {
            $appUrl = 'https://www.listify.asia';
        }

        return $appUrl . $path;
    }

    protected function base64UrlEncode(string $data): string
    {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }
}
