<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

/**
 * Mobile app authentication (Bearer token).
 */
class MobileAuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
            'device_name' => 'nullable|string|max:100',
        ]);

        if (!Schema::hasTable('user_api_tokens')) {
            return response()->json([
                'success' => false,
                'message' => 'API tokens table missing. Run database/mobile_push_api_setup.sql on server.',
            ], 503);
        }

        $user = User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid email or password',
            ], 401);
        }

        if (isset($user->status) && (int) $user->status === 0) {
            return response()->json([
                'success' => false,
                'message' => 'Account is inactive',
            ], 403);
        }

        $plain = 'listify_' . Str::random(48);
        $deviceName = $request->input('device_name', 'mobile-app');

        // Optional: one token per device_name — replace old
        DB::table('user_api_tokens')
            ->where('user_id', $user->id)
            ->where('name', $deviceName)
            ->delete();

        DB::table('user_api_tokens')->insert([
            'user_id' => $user->id,
            'name' => substr((string) $deviceName, 0, 100),
            'token' => hash('sha256', $plain),
            'last_used_at' => now(),
            'expires_at' => now()->addYear(),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return response()->json([
            'success' => true,
            'token' => $plain,
            'token_type' => 'Bearer',
            'expires_in_days' => 365,
            'user' => $this->userPayload($user),
        ]);
    }

    public function me(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        return response()->json([
            'success' => true,
            'user' => $this->userPayload($user),
        ]);
    }

    public function logout(Request $request)
    {
        $tokenId = $request->attributes->get('api_token_id');
        if ($tokenId && Schema::hasTable('user_api_tokens')) {
            DB::table('user_api_tokens')->where('id', $tokenId)->delete();
        }

        return response()->json([
            'success' => true,
            'message' => 'Logged out',
        ]);
    }

    protected function userPayload(User $user): array
    {
        return [
            'id' => (int) $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'phone' => $user->phone ?? null,
            'role' => (int) ($user->role ?? 0),
            'is_agent' => (int) ($user->is_agent ?? 0),
            'image' => $user->image ?? null,
        ];
    }
}
