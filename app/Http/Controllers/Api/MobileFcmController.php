<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\FirebaseNotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * Mobile app FCM device token APIs.
 * After register, the same server events (enquiry / chat / order) push to this device.
 */
class MobileFcmController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'fcm_token' => 'required|string|max:2048',
            'platform' => 'required|in:android,ios,web',
            'device_id' => 'nullable|string|max:191',
            'device_label' => 'nullable|string|max:255',
        ]);

        $user = $request->user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        if (!Schema::hasTable('fcm_tokens')) {
            return response()->json([
                'success' => false,
                'message' => 'fcm_tokens table missing. Run database/mobile_push_api_setup.sql',
            ], 503);
        }

        $token = trim($request->input('fcm_token'));
        $platform = $request->input('platform');
        $deviceId = $request->input('device_id');
        $deviceLabel = $request->input('device_label')
            ?: ($platform . ' app');

        // Same physical device → replace old token
        if ($deviceId) {
            DB::table('fcm_tokens')
                ->where('user_id', $user->id)
                ->where('device_id', $deviceId)
                ->where('token', '!=', $token)
                ->delete();
        }

        // Same token elsewhere → reassign to this user
        DB::table('fcm_tokens')->where('token', $token)->where('user_id', '!=', $user->id)->delete();

        $existing = DB::table('fcm_tokens')
            ->where('user_id', $user->id)
            ->where('token', $token)
            ->first();

        $payload = [
            'device_label' => substr((string) $deviceLabel, 0, 255),
            'updated_at' => now(),
        ];

        if (Schema::hasColumn('fcm_tokens', 'platform')) {
            $payload['platform'] = $platform;
        }
        if (Schema::hasColumn('fcm_tokens', 'device_id')) {
            $payload['device_id'] = $deviceId;
        }

        if ($existing) {
            DB::table('fcm_tokens')->where('id', $existing->id)->update($payload);
        } else {
            $insert = array_merge($payload, [
                'user_id' => $user->id,
                'token' => $token,
                'created_at' => now(),
            ]);
            DB::table('fcm_tokens')->insert($insert);
        }

        // Keep legacy column as last-known token
        if (Schema::hasColumn('users', 'fcm_token')) {
            DB::table('users')->where('id', $user->id)->update(['fcm_token' => $token]);
        }

        return response()->json([
            'success' => true,
            'user_id' => (int) $user->id,
            'platform' => $platform,
            'message' => 'FCM token registered. This device will receive enquiry, chat and order pushes.',
        ]);
    }

    public function unregister(Request $request)
    {
        $request->validate([
            'fcm_token' => 'nullable|string|max:2048',
            'device_id' => 'nullable|string|max:191',
        ]);

        $user = $request->user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        if (!Schema::hasTable('fcm_tokens')) {
            return response()->json(['success' => true, 'message' => 'Nothing to remove']);
        }

        $q = DB::table('fcm_tokens')->where('user_id', $user->id);

        if ($request->filled('fcm_token')) {
            $q->where('token', $request->input('fcm_token'));
        } elseif ($request->filled('device_id') && Schema::hasColumn('fcm_tokens', 'device_id')) {
            $q->where('device_id', $request->input('device_id'));
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Provide fcm_token or device_id',
            ], 422);
        }

        $deleted = $q->delete();

        return response()->json([
            'success' => true,
            'deleted' => $deleted,
        ]);
    }

    public function devices(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        $rows = [];
        if (Schema::hasTable('fcm_tokens')) {
            $rows = DB::table('fcm_tokens')
                ->where('user_id', $user->id)
                ->orderByDesc('updated_at')
                ->get()
                ->map(function ($row) {
                    return [
                        'id' => (int) $row->id,
                        'platform' => $row->platform ?? 'web',
                        'device_id' => $row->device_id ?? null,
                        'device_label' => $row->device_label,
                        'token_preview' => substr((string) $row->token, 0, 12) . '…',
                        'updated_at' => $row->updated_at,
                    ];
                })
                ->values()
                ->all();
        }

        return response()->json([
            'success' => true,
            'count' => count($rows),
            'devices' => $rows,
        ]);
    }

    /**
     * Send a test push to the logged-in user's devices (for app QA).
     */
    public function test(Request $request, FirebaseNotificationService $firebase)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Unauthenticated'], 401);
        }

        $ok = $firebase->sendToUser(
            (int) $user->id,
            'Listify test notification',
            'Mobile push is working on your device.',
            [
                'type' => 'test',
                'click_action' => '/agent/appointment',
            ]
        );

        return response()->json([
            'success' => $ok,
            'message' => $ok
                ? 'Test push sent'
                : 'Push failed — no FCM token registered or Firebase disabled',
        ]);
    }
}
