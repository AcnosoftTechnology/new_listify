<?php

namespace App\Services;

use Firebase\JWT\JWK;
use Firebase\JWT\JWT;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class AppleTokenVerifier
{
    public function verify(string $idToken): array
    {
        $keys = Cache::remember('apple_jwks', now()->addHours(12), function () {
            return Http::timeout(10)
                ->get('https://appleid.apple.com/auth/keys')
                ->throw()
                ->json();
        });

        try {
            // Signature, kid and expiry verification
            $claims = (array) JWT::decode(
                $idToken,
                JWK::parseKeySet($keys)
            );
        } catch (\Throwable $e) {
            throw new RuntimeException('Invalid or expired Apple identity token.');
        }

        if (($claims['iss'] ?? null) !== 'https://appleid.apple.com') {
            throw new RuntimeException('Invalid Apple token issuer.');
        }

        if (! in_array($claims['aud'] ?? null, config('services.apple.client_ids'), true)) {
            throw new RuntimeException('Apple token is not issued for this app.');
        }

        if (empty($claims['sub'])) {
            throw new RuntimeException('Apple user ID is missing.');
        }

        return $claims;
    }
}