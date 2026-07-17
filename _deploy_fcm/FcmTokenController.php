<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class FcmTokenController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'fcm_token' => 'required|string|max:512',
        ]);

        $user = Auth::user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        // Vendors / agents only — enquiry pushes target agent_id devices
        if (!(int) ($user->is_agent ?? 0) && (int) ($user->role ?? 0) !== 2) {
            return response()->json(['success' => true, 'skipped' => 'not_vendor']);
        }

        $token = $request->input('fcm_token');
        $deviceLabel = substr((string) $request->userAgent(), 0, 255);

        if (Schema::hasColumn('users', 'fcm_token')) {
            DB::table('users')->where('id', $user->id)->update(['fcm_token' => $token]);
        }

        if (Schema::hasTable('fcm_tokens')) {
            $existing = DB::table('fcm_tokens')
                ->where('user_id', $user->id)
                ->where('token', $token)
                ->first();

            if ($existing) {
                DB::table('fcm_tokens')->where('id', $existing->id)->update([
                    'device_label' => $deviceLabel,
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('fcm_tokens')->insert([
                    'user_id' => $user->id,
                    'token' => $token,
                    'device_label' => $deviceLabel,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        return response()->json([
            'success' => true,
            'user_id' => $user->id,
        ]);
    }
}
