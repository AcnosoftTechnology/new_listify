<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Symfony\Component\HttpFoundation\Response;

class AuthenticateApiToken
{
    public function handle(Request $request, Closure $next): Response
    {
        $plain = $this->bearerToken($request);
        if ($plain === '') {
            return response()->json([
                'success' => false,
                'message' => 'Missing Authorization Bearer token',
            ], 401);
        }

        if (!Schema::hasTable('user_api_tokens')) {
            return response()->json([
                'success' => false,
                'message' => 'API tokens table missing. Run database/mobile_push_api_setup.sql',
            ], 503);
        }

        $hash = hash('sha256', $plain);
        $row = DB::table('user_api_tokens')
            ->where('token', $hash)
            ->first();

        if (!$row) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid API token',
            ], 401);
        }

        if (!empty($row->expires_at) && now()->greaterThan($row->expires_at)) {
            DB::table('user_api_tokens')->where('id', $row->id)->delete();

            return response()->json([
                'success' => false,
                'message' => 'API token expired. Please login again.',
            ], 401);
        }

        $user = DB::table('users')->where('id', $row->user_id)->first();
        if (!$user || (isset($user->status) && (int) $user->status === 0)) {
            return response()->json([
                'success' => false,
                'message' => 'User not found or inactive',
            ], 401);
        }

        DB::table('user_api_tokens')->where('id', $row->id)->update([
            'last_used_at' => now(),
            'updated_at' => now(),
        ]);

        // Attach for controllers
        $request->attributes->set('api_user', $user);
        $request->attributes->set('api_token_id', $row->id);
        $request->setUserResolver(function () use ($user) {
            return \App\Models\User::find($user->id);
        });

        return $next($request);
    }

    protected function bearerToken(Request $request): string
    {
        $header = (string) $request->header('Authorization', '');
        if (preg_match('/^\s*Bearer\s+(\S+)\s*$/i', $header, $m)) {
            return $m[1];
        }

        return trim((string) $request->input('api_token', ''));
    }
}
