<?php 
namespace App\Models\payment_gateway;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use PhonePe\Env;
use PhonePe\common\exceptions\PhonePeException;
use PhonePe\payments\v2\standardCheckout\StandardCheckoutClient;
use PhonePe\payments\v2\models\request\builders\StandardCheckoutPayRequestBuilder;

class PhonePe extends Model
{
    use HasFactory;

    public static function payment_status($identifier, $transaction_keys = [])
    {
        $payment_gateway = DB::table('payment_geteways')->where('identifier', $identifier)->first();
        $keys = json_decode($payment_gateway->keys, true);
        
        try {
            $client = StandardCheckoutClient::getInstance(
                $keys['client_id'],
                (int) $keys['client_version'],
                $keys['client_secret'],
                $keys['env'] ?? 'PRODUCTION'
            );

            $res = $client->getOrderStatus($transaction_keys['merchantOrderId'], true);
            
            if ($res->getState() == 'COMPLETED') {
                return true;
            } else {
                return false;
            }


        } catch (PhonePeException $e) {
            return false;
        }
    }

    public static function payment_create($identifier)
    {
        $payment_details = session('payment_details');
        $payment_gateway = DB::table('payment_geteways')
            ->where('identifier', $identifier)
            ->first();
            
        $keys = json_decode($payment_gateway->keys, true);
        
        // Merchant order id must be <= 63 chars
        $merchantOrderId = 'ORD_' . Str::upper(Str::random(20));
        $amountPaise = (int) round($payment_details['payable_amount'] * 100);

        try {
            $client = StandardCheckoutClient::getInstance(
                $keys['client_id'],
                (int) $keys['client_version'],
                $keys['client_secret'],
                $keys['env'] ?? 'PRODUCTION'
            );

            $payRequest = StandardCheckoutPayRequestBuilder::builder()
                ->merchantOrderId($merchantOrderId)
                ->amount($amountPaise)
                ->redirectUrl(route('phonepe.redirect'))
                ->message('Order #' . $merchantOrderId)
                ->build();

            $payResponse = $client->pay($payRequest);

            if ($payResponse->getState() === 'PENDING') {
                // Store the merchantOrderId in session for verification later
                session()->put('phonepe_merchant_order_id', $merchantOrderId);
                
                return [
                    'redirect_url' => $payResponse->getRedirectUrl(),
                    'merchant_order_id' => $merchantOrderId
                ];
            }

            return ['error' => 'Payment initiation failed'];
        } catch (PhonePeException $e) {
            return ['error' => $e->getMessage()];
        }
    }
}