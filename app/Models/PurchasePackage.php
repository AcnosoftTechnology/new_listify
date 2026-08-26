<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon; 
class PurchasePackage extends Model
{
    use HasFactory;

// public static function purchase_package($identifier){
//     $package = session('payment_details');

//     if (!isset($package['items'][0])) {
//         throw new \Exception('Invalid payment details structure. Missing items.');
//     }

//     $period = strtolower(trim($package['items'][0]['period']));

//     if ($period == 'semiannually') {
//         $expireDate = Carbon::now()->addDays(180)->timestamp;
//     } elseif ($period == 'monthly') {
//         $expireDate = Carbon::now()->addMonth()->timestamp;
//     } elseif ($period == 'annually') {
//         $expireDate = Carbon::now()->addYear()->timestamp;
//     } else {
//         throw new \Exception("Invalid package period: " . $period);
//     }

//     // Purani active subscription deactivate
//     deactivate_user_subscriptions(user('id'));

//     // New subscription
//     $sub = [
//         'user_id'        => user('id'),
//         'package_id'     => $package['items'][0]['id'],
//         'paid_amount'    => $package['items'][0]['price'],
//         'payment_method' => $identifier,

//         // Razorpay Details
//         'razorpay_payment_id'      => session('razorpay_payment_id'),
//         'razorpay_order_id'        => session('razorpay_order_id'),
//         'razorpay_signature'       => session('razorpay_signature'),
//         'razorpay_subscription_id' => session('razorpay_subscription_id'),

//         'status'            => 1,
//         'auto_subscription' => 0,
//         'expire_date'       => $expireDate,
//         'date_added'        => time(),
//         'created_at'        => now(),
//         'updated_at'        => now(),
//     ];
    
//     Subscription::insert($sub);

//     User::where('id', user('id'))->update([
//         'is_agent' => 1,
//         'type'     => 'agent',
//     ]);

//     Session::flash('success', get_phrase('Subscription activated successfully!'));

//     return redirect()->route('customer.wishlist');
// }

public static function purchase_package($identifier)
{
    $package = session('payment_details');

    if (!$package) {
        throw new \Exception('Payment details not found in session.');
    }

    // Billing details jo payment se pehle AJAX ke through session mein save hui hain
    $billing = $package['billing_details'] ?? [];

    // Tax details jo payment se pehle AJAX ke through session mein save hui hain
    $taxDetails = $package['tax_details'] ?? [];

    if (!isset($package['items'][0])) {
        throw new \Exception('Invalid payment details structure. Missing items.');
    }


    /*
    |--------------------------------------------------------------------------
    | PACKAGE + GST AMOUNTS
    |--------------------------------------------------------------------------
    */

    // Original package amount
    $packageAmount = (float) (
        $taxDetails['package_amount']
        ?? $package['items'][0]['price']
        ?? 0
    );

    // IGST Amount
    $igstAmount = (float) (
        $taxDetails['igst_amount'] ?? 0
    );

    // CGST Amount
    $cgstAmount = (float) (
        $taxDetails['cgst_amount'] ?? 0
    );

    // SGST Amount
    $sgstAmount = (float) (
        $taxDetails['sgst_amount'] ?? 0
    );

    // Total GST Amount
    $totalTaxAmount = (float) (
        $taxDetails['total_tax_amount']
        ?? ($igstAmount + $cgstAmount + $sgstAmount)
    );

    // Final Amount = Package Amount + GST
    $grandTotal = (float) (
        $taxDetails['grand_total']
        ?? ($packageAmount + $totalTaxAmount)
    );


    /*
    |--------------------------------------------------------------------------
    | PACKAGE PERIOD
    |--------------------------------------------------------------------------
    */

    $period = strtolower(trim($package['items'][0]['period']));

    if ($period == 'semiannually') {

        $expireDate = Carbon::now()->addDays(180)->timestamp;

    } elseif ($period == 'monthly') {

        $expireDate = Carbon::now()->addMonth()->timestamp;

    } elseif ($period == 'annually') {

        $expireDate = Carbon::now()->addYear()->timestamp;

    } else {

        throw new \Exception(
            "Invalid package period: " . $period
        );
    }


    /*
    |--------------------------------------------------------------------------
    | Purani active subscription deactivate
    |--------------------------------------------------------------------------
    */

    deactivate_user_subscriptions(user('id'));


    /*
    |--------------------------------------------------------------------------
    | New Subscription
    |--------------------------------------------------------------------------
    */

    $sub = [

        'user_id' => user('id'),


        // =========================
        // BILLING DETAILS
        // =========================

        'billing_name'    => $billing['billing_name'] ?? null,
        'billing_email'   => $billing['billing_email'] ?? null,
        'billing_phone'   => $billing['billing_phone'] ?? null,
        'billing_address' => $billing['billing_address'] ?? null,
        'billing_city'    => $billing['billing_city'] ?? null,
        'billing_state'   => $billing['billing_state'] ?? null,
        'billing_country' => $billing['billing_country'] ?? null,
        'billing_pincode' => $billing['billing_pincode'] ?? null,


        // =========================
        // GST DETAILS
        // =========================

        'has_gst'    => $billing['has_gst'] ?? 0,
        'gst_number' => $billing['gst_number'] ?? null,


        // =========================
        // PACKAGE DETAILS
        // =========================

        'package_id' => $package['items'][0]['id'],

        // Original Package Price
        'package_amount' => $packageAmount,

        // IGST
        'igst_amount' => $igstAmount,

        // CGST
        'cgst_amount' => $cgstAmount,

        // SGST
        'sgst_amount' => $sgstAmount,

        // Total GST
        'total_tax_amount' => $totalTaxAmount,

        // Final Amount including GST
        'paid_amount' => $grandTotal,

        'payment_method' => $identifier,


        // =========================
        // RAZORPAY DETAILS
        // =========================

        'razorpay_payment_id'      => session('razorpay_payment_id'),
        'razorpay_order_id'        => session('razorpay_order_id'),
        'razorpay_signature'       => session('razorpay_signature'),
        'razorpay_subscription_id' => session('razorpay_subscription_id'),


        // =========================
        // SUBSCRIPTION DETAILS
        // =========================

        'status'            => 1,
        'auto_subscription' => 0,
        'expire_date'       => $expireDate,
        'date_added'        => time(),
        'created_at'        => now(),
        'updated_at'        => now(),
    ];


    /*
    |--------------------------------------------------------------------------
    | Save Subscription
    |--------------------------------------------------------------------------
    */

    Subscription::insert($sub);


    /*
    |--------------------------------------------------------------------------
    | Update User
    |--------------------------------------------------------------------------
    */

    User::where('id', user('id'))->update([
        'is_agent' => 1,
        'type'     => 'agent',
    ]);


    /*
    |--------------------------------------------------------------------------
    | Success Message
    |--------------------------------------------------------------------------
    */

    Session::flash(
        'success',
        get_phrase('Subscription activated successfully!')
    );


    return redirect()->route('customer.wishlist');
}
    
}
