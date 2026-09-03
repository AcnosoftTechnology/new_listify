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
            'fcm_token' => 'required|string|max:2048',
        ]);

        $user = Auth::user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        // All logged-in users: vendors get enquiry + chat, customers get chat replies
        $token = $request->input('fcm_token');
        $deviceLabel = substr((string) $request->userAgent(), 0, 255);

        if (Schema::hasColumn('users', 'fcm_token')) {
            DB::table('users')->where('id', $user->id)->update(['fcm_token' => $token]);
        }

        if (Schema::hasTable('fcm_tokens')) {
            // Replace stale token for the same browser/device label
            DB::table('fcm_tokens')
                ->where('user_id', $user->id)
                ->where('device_label', $deviceLabel)
                ->where('token', '!=', $token)
                ->delete();

            $existing = DB::table('fcm_tokens')
                ->where('user_id', $user->id)
                ->where('token', $token)
                ->first();

            $row = [
                'device_label' => $deviceLabel,
                'updated_at' => now(),
            ];
            if (Schema::hasColumn('fcm_tokens', 'platform')) {
                $row['platform'] = 'web';
            }

            if ($existing) {
                DB::table('fcm_tokens')->where('id', $existing->id)->update($row);
            } else {
                $row['user_id'] = $user->id;
                $row['token'] = $token;
                $row['created_at'] = now();
                DB::table('fcm_tokens')->insert($row);
            }
        }

        return response()->json([
            'success' => true,
            'user_id' => $user->id,
        ]);
    }
}
