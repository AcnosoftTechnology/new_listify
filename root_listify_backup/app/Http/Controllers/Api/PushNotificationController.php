<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\FirebaseNotificationService;
use Illuminate\Http\Request;

/**
 * Future-ready API: external events can hit this to send FCM push.
 * Protected by X-Push-Api-Key header (= FIREBASE_PUSH_API_KEY).
 */
class PushNotificationController extends Controller
{
    public function send(Request $request, FirebaseNotificationService $firebase)
    {
        $expected = (string) config('services.firebase.push_api_key');
        $provided = (string) $request->header('X-Push-Api-Key', '');

        if ($expected === '' || !hash_equals($expected, $provided)) {
            return response()->json(['success' => false, 'message' => 'Unauthorized'], 401);
        }

        $request->validate([
            'user_id' => 'required|integer',
            'title' => 'required|string|max:255',
            'body' => 'required|string|max:1000',
            'data' => 'nullable|array',
        ]);

        $ok = $firebase->sendToUser(
            (int) $request->input('user_id'),
            $request->input('title'),
            $request->input('body'),
            $request->input('data', [])
        );

        return response()->json([
            'success' => $ok,
            'message' => $ok
                ? 'Notification sent'
                : 'Notification not sent (token missing or Firebase disabled)',
        ]);
    }
}
