<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PhonePePaymentController extends Controller
{
    private $clientId;
    private $clientSecret;
    private $authUrl;
    private $paymentUrl;
    private $statusUrlBase;

    public function __construct()
    {
        $this->clientId     = 'SU2508082020272972840894';
        $this->clientSecret = 'a0d4dee5-14d2-4216-8062-8cfb240248d1';
        $this->authUrl      = 'https://api.phonepe.com/apis/identity-manager/v1/oauth/token';
        $this->paymentUrl   = 'https://api.phonepe.com/apis/pg/checkout/v2/pay';
        $this->statusUrlBase = 'https://api.phonepe.com/apis/pg/checkout/v2/status/';
    }

    /**
     * Show the payment form
     */
    public function showPaymentForm()
    {
        return view('frontend/pay-form');
    }

    /**
     * Generate PhonePe Auth Token
     */
    private function getAuthToken()
    {
        $url = "{$this->authUrl}?client_id={$this->clientId}&client_version=1&client_secret={$this->clientSecret}&grant_type=client_credentials";

        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded'],
        ]);

        $response = curl_exec($ch);
        curl_close($ch);

        $result = json_decode($response, true);

        Log::info('Auth Token Response', $result ?? []);

        return $result['access_token'] ?? null;
    }

    /**
     * Initiate payment
     */
    public function initiatePayment(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'phone' => 'required|digits:10',
            'amount' => 'required|numeric|min:1',
        ]);

        $amountInPaise = $request->amount * 100;
        $description   = $request->description;

        $token = $this->getAuthToken();
        if (!$token) {
            return back()->with('error', 'Unable to generate token');
        }

        $merchantOrderId = "TX" . time();
        session([
            'phonepe_order_id' => $merchantOrderId,
            'customer_name' => $request->name,
            'customer_phone' => $request->phone
        ]);

        $payload = [
            "merchantOrderId" => $merchantOrderId,
            "amount" => $amountInPaise,
            "expireAfter" => 1200,
            "paymentFlow" => [
                "type" => "PG_CHECKOUT",
                "message" => $description,
                "merchantUrls" => [
                    "redirectUrl" => route('phonepe.callback')
                ]
            ],
              "metaInfo" => [
                  "udf1" => $request->name,
                  "udf2" => $request->phone,
                  "udf3" => $request->description
              ]
        ];

        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $this->paymentUrl,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/json',
                'Authorization: O-Bearer ' . $token,
                'X-VERIFY: ' . hash_hmac('sha256', json_encode($payload), $this->clientSecret)
            ],
        ]);

        $response = curl_exec($ch);
        curl_close($ch);

        $result = json_decode($response, true);

        Log::info('Payment Initiation Response', $result ?? []);

        if (!empty($result['redirectUrl'])) {
            return redirect()->away($result['redirectUrl']);
        }

        return back()->with('error', 'Unable to initiate payment');
    }

    /**
     * Handle payment callback
     */
    public function paymentCallback(Request $request)
    {
        $orderId = session('phonepe_order_id');

        if (!$orderId) {
            return view('payment-failed', ['data' => ['message' => 'Order ID missing']]);
        }

        $token = $this->getAuthToken();
        if (!$token) {
            return view('payment-failed', ['data' => ['message' => 'Token generation failed']]);
        }

        $statusUrl = $this->statusUrlBase . $orderId;

        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $statusUrl,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/json',
                'Authorization: O-Bearer ' . $token
            ],
        ]);

        $response = curl_exec($ch);
        curl_close($ch);

        $result = json_decode($response, true);

        Log::info('Payment Status Response', $result ?? []);

        if (!empty($result['state']) && $result['state'] === 'COMPLETED') {
            return view('payment-success', ['data' => $result]);
        } else {
            return view('payment-failed', ['data' => $result]);
        }
    }
}
