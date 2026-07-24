<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ChatConciergeController extends Controller
{
    /**
     * Same-origin proxy for the AI Concierge widget.
     * Browsers call www.listify.asia; this forwards to api.listify.asia.
     */
    public function handleChat(Request $request)
    {
        $request->validate([
            'message'    => 'required|string',
            'session_id' => 'nullable|string',
            'user_name'  => 'nullable|string',
        ]);

        $baseUrl = rtrim(config('services.listify_api.url', 'https://api.listify.asia'), '/');
        $verifySsl = (bool) config('services.listify_api.verify_ssl', false);

        try {
            $response = Http::timeout(60)
                ->withOptions(['verify' => $verifySsl])
                ->acceptJson()
                ->asJson()
                ->post($baseUrl . '/api/v1/chat/concierge', [
                    'message'    => $request->message,
                    'session_id' => $request->session_id,
                    'user_name'  => $request->user_name ?? 'Guest',
                ]);

            if ($response->failed()) {
                Log::error('Concierge proxy upstream error', [
                    'status' => $response->status(),
                    'body'   => $response->body(),
                ]);

                return response()->json(
                    $response->json() ?? [
                        'status'  => false,
                        'message' => 'Unable to reach AI Assistant.',
                    ],
                    $response->status()
                );
            }

            return response()->json($response->json());
        } catch (\Throwable $e) {
            Log::error('Concierge proxy exception', [
                'message' => $e->getMessage(),
            ]);

            return response()->json([
                'status'  => false,
                'message' => 'Connection error. Please try again.',
            ], 502);
        }
    }
}
