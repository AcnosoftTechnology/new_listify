<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class VerifyPhonePeOrigin
{
    public function handle(Request $request, Closure $next)
    {
        // Skip verification in local environment
        if (app()->environment('local')) {
            return $next($request);
        }

        $allowedOrigins = [
            'https://listify.asia',
            'https://api.phonepe.com'
        ];

        $origin = parse_url($request->headers->get('origin'), PHP_URL_HOST);

        if (!in_array($origin, $allowedOrigins)) {
            \Log::warning('Unauthorized origin attempt', [
                'origin' => $origin,
                'ip' => $request->ip(),
                'url' => $request->fullUrl()
            ]);
            
            return response()->json([
                'status' => false,
                'message' => 'Unauthorized origin'
            ], 403);
        }

        return $next($request);
    }
}