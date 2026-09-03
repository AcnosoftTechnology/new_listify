<?php

namespace App\Models\payment_gateway;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Razorpay\Api\Api;

class Razorpay extends Model {
    use HasFactory;

    public static function payment_status($identifier, $transaction_keys = [])
    {

        $payment_gateway = DB::table('payment_geteways')->where('identifier', $identifier)->first();
        $keys = json_decode($payment_gateway->keys, true);

        $public_key = $keys['public_key'];
        $secret_key = $keys['secret_key'];
        
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.razorpay.com/v1/payments/' . $transaction_keys['razorpay_payment_id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Basic ' . base64_encode($public_key . ':' . $keys['secret_key'])
            ),
        ));

        $response = curl_exec($curl);
      
        curl_close($curl);

        $response = json_decode($response);
       
         return true;
    }

    public static function payment_create($identifier)
    {
        $payment_details = session('payment_details');
        $user            = DB::table('users')->where('id', auth()->user()->id)->first();
        $model           = $payment_details['success_method']['model_name'];
        $payment_gateway = DB::table('payment_geteways')
                ->where('identifier', $identifier)
                ->first();

        $keys = json_decode($payment_gateway->keys, true);
        $public_key = $keys['public_key'];
        $secret_key = $keys['secret_key'];
        $color      = '';


        $receipt_id = Str::random(20);
        $api        = new Api($public_key, $secret_key);

        $order = $api->order->create(array(
            'receipt'  => $receipt_id,
            'amount'   => round($payment_details['payable_amount'] * 100, 2),
            'currency' => $payment_gateway->currency,
        ));

        $page_data = [
            'order_id'    => $order['id'],
            'razorpay_id' => $public_key,
            'amount'      => round($payment_details['payable_amount'] * 100, 2),

            'name'        => $user->name,
            'currency'    => $payment_gateway->currency,
            'email'       => $user->email,
            'phone'       => $user->phone,
            'address'     => $user->address,
            'description' => isset($payment_details['custom_field']['description']) ? $payment_details['custom_field']['description'] : '',
        ];

        $data = [
            'page_data'       => $page_data,
            'color'           => null,
            'payment_details' => $payment_details,
        ];
        return $data;
    }

    public static function subscription_create($identifier, $plan_id){

        $payment_details = session('payment_details');

        $user = DB::table('users')
            ->where('id', auth()->user()->id)
            ->first();

        $payment_gateway = DB::table('payment_geteways')
            ->where('identifier', $identifier)
            ->first();

        $keys = json_decode($payment_gateway->keys, true);

        $public_key = $keys['public_key'];
        $secret_key = $keys['secret_key'];

        // ADD THIS (Missing tha)
        $api = new Api($public_key, $secret_key);

        // Package Period
        $period = strtolower(trim($payment_details['items'][0]['period']));

        if ($period == 'monthly') {
            $totalCount = 120; // 120 months
        } elseif ($period == 'annually') {
            $totalCount = 10; // 10 years
        } else {
            throw new \Exception('Invalid package period : ' . $period);
        }

        $subscription = $api->subscription->create([
            'plan_id'         => $plan_id,
            'customer_notify' => 1,
            'quantity'        => 1,
            'total_count'     => $totalCount,
        ]);

        $page_data = [
            'subscription_id' => $subscription['id'],
            'razorpay_id'     => $public_key,

            'name'            => $user->name,
            'email'           => $user->email,
            'phone'           => $user->phone,

            'description'     => 'Premium Subscription',
        ];

        return [
            'page_data'       => $page_data,
            'payment_details' => $payment_details,
            'color'           => null,
        ];
    }

}
