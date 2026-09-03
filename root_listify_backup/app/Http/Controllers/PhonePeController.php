<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

use PhonePe\Env;
use PhonePe\common\exceptions\PhonePeException;
use PhonePe\payments\v2\standardCheckout\StandardCheckoutClient;
use PhonePe\payments\v2\models\request\builders\StandardCheckoutPayRequestBuilder;
use PhonePe\payments\v2\models\request\builders\StandardCheckoutRefundRequestBuilder;

class PhonePeController extends Controller
{
    /** Singleton client from SDK (docs: StandardCheckoutClient::getInstance) */
    protected function client(): StandardCheckoutClient
    {
        return StandardCheckoutClient::getInstance(
            config('phonepe.client_id'),
            (int) config('phonepe.client_version'),
            config('phonepe.client_secret'),
            config('phonepe.env')
            // 5th param ($shouldPublishEvents) optional, default false
        );
    }

    /** Simple form to test */
    public function showPayForm()
    {
        return view('pay');
    }

    /** Initiate payment (docs: pay() with StandardCheckoutPayRequestBuilder) */
    public function initiate(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric|min:1',
        ]);

        // Merchant order id must be <= 63 chars, allowed [_ -] (docs)
        $merchantOrderId = 'ORD_' . Str::upper(Str::random(20));

        $amountPaise = (int) round($request->input('amount') * 100);

        try {
            $payRequest = StandardCheckoutPayRequestBuilder::builder()
                ->merchantOrderId($merchantOrderId)
                ->amount($amountPaise)                         // in paise
                ->redirectUrl(config('phonepe.redirect_url'))  // optional but recommended
                ->message('Order #' . $merchantOrderId)        // optional
                ->build();

            $payResponse = $this->client()->pay($payRequest);  // returns redirectUrl & state

            if ($payResponse->getState() === 'PENDING') {
                // Store your order locally as "pending"
                session()->flash('merchantOrderId', $merchantOrderId);
                return redirect()->away($payResponse->getRedirectUrl());
            }

            return back()->withErrors(['phonepe' => 'Payment initiation failed: ' . $payResponse->getState()]);
        } catch (PhonePeException $e) {
            Log::error('PhonePe pay error', ['msg' => $e->getMessage(), 'code' => $e->getHttpStatusCode()]);
            return back()->withErrors(['phonepe' => 'PhonePe error: ' . $e->getMessage()]);
        } catch (\Throwable $t) {
            Log::error('PhonePe pay throwable', ['msg' => $t->getMessage()]);
            return back()->withErrors(['phonepe' => 'Unexpected error: ' . $t->getMessage()]);
        }
    }

    /** Optional landing after redirect (success/fail page) */
    public function redirectHandler(Request $request)
    {
        // User yahan aayega after payment page.
        // Final status aap webhook se verify karo, ya manual status check call karo.
        $merchantOrderId = session('merchantOrderId');
        return view('redirect', compact('merchantOrderId'));
    }

    /** Callback/Webhook handler (docs: verifyCallbackResponse with Basic Auth) */
    public function callback(Request $request)
    {
        try {
            // Build headers array like getallheaders()
            $headers = [];
            foreach ($request->headers->all() as $key => $values) {
                $headers[$key] = is_array($values) ? implode(',', $values) : $values;
            }

            $username = config('phonepe.callback_username');
            $password = config('phonepe.callback_password');

            $payload = json_decode($request->getContent(), true);

            $resp = $this->client()->verifyCallbackResponse(
                $headers,
                $payload,
                $username,
                $password
            );

            // $resp->getType() e.g. CHECKOUT_ORDER_COMPLETED / FAILED / PG_REFUND_COMPLETED ...
            // $resp->getPayload() me details (orderId, originalMerchantOrderId, amount, state, paymentDetails)
            Log::info('PhonePe callback ok', [
                'type'    => method_exists($resp, 'getType') ? $resp->getType() : null,
                'payload' => method_exists($resp, 'getPayload') ? $resp->getPayload() : null,
            ]);

            // TODO: yahan apni order table update karein (PAID/FAILED), idempotency maintain karein.
            return response('OK', 200);
        } catch (PhonePeException $e) {
            Log::error('PhonePe callback verify failed', ['msg' => $e->getMessage(), 'code' => $e->getHttpStatusCode()]);
            return response('Bad Request', 400);
        } catch (\Throwable $t) {
            Log::error('PhonePe callback throwable', ['msg' => $t->getMessage()]);
            return response('Server Error', 500);
        }
    }

    /** Manual status check (docs: getOrderStatus($merchantOrderId, $details)) */
    public function status(string $merchantOrderId)
    {
        try {
            $res = $this->client()->getOrderStatus($merchantOrderId, true); // true => all attempts
            return response()->json([
                'merchantOrderId' => $merchantOrderId,
                'state'           => $res->getState(),
                'amount'          => $res->getAmount(),
                'orderId'         => $res->getOrderId(),
                'expireAt'        => $res->getExpireAt(),
                // 'paymentDetails' => $res->getPaymentDetails(), // uncomment if needed
            ]);
        } catch (PhonePeException $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }

    /** Refund (docs: StandardCheckoutRefundRequestBuilder + refund()) */
    public function refund(Request $request)
    {
        $request->validate([
            'merchantOrderId' => 'required|string|max:63',
            'amount'          => 'required|numeric|min:1',
        ]);

        $merchantRefundId = 'RFD_' . Str::upper(Str::random(22));
        $amountPaise = (int) round($request->input('amount') * 100);

        try {
            $refundRequest = StandardCheckoutRefundRequestBuilder::builder()
                ->merchantRefundId($merchantRefundId)
                ->originalMerchantOrderId($request->input('merchantOrderId'))
                ->amount($amountPaise)
                ->build();

            $res = $this->client()->refund($refundRequest);

            return response()->json([
                'merchantRefundId' => $merchantRefundId,
                'state'            => $res->getState(),
                'amount'           => $res->getAmount(),
                'refundId'         => $res->getRefundId(),
            ]);
        } catch (PhonePeException $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }

    /** Refund status (docs: getRefundStatus($merchantRefundId)) */
    public function refundStatus(string $merchantRefundId)
    {
        try {
            $res = $this->client()->getRefundStatus($merchantRefundId);
            return response()->json([
                'merchantRefundId' => $merchantRefundId,
                'state'            => $res->getState(),
                'amount'           => $res->getAmount(),
            ]);
        } catch (PhonePeException $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
}
