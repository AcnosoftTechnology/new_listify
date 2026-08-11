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

public static function purchase_package($identifier)
{
    $package = session('payment_details');

    if (!isset($package['items'][0])) {
        throw new \Exception('Invalid payment details structure. Missing items.');
    }

    $period = strtolower(trim($package['items'][0]['period']));

    if ($period == 'semiannually') {
        $expireDate = Carbon::now()->addDays(180)->timestamp;
    } elseif ($period == 'monthly') {
        $expireDate = Carbon::now()->addMonth()->timestamp;
    } elseif ($period == 'annually') {
        $expireDate = Carbon::now()->addYear()->timestamp;
    } else {
        throw new \Exception("Invalid package period: " . $period);
    }

    // Purani active subscription deactivate
    deactivate_user_subscriptions(user('id'));

    // New subscription
    $sub = [
        'user_id'           => user('id'),
        'package_id'        => $package['items'][0]['id'],
        'paid_amount'       => $package['items'][0]['price'],
        'payment_method'    => $identifier,
        'status'            => 1,
        'auto_subscription' => 0,
        'expire_date'       => $expireDate,
        'date_added'        => time(),
        'created_at'        => now(),
        'updated_at'        => now(),
    ];

    Subscription::insert($sub);

    User::where('id', user('id'))->update([
        'is_agent' => 1,
        'type'     => 'agent',
    ]);

    Session::flash('success', get_phrase('Subscription activated successfully!'));

    return redirect()->route('customer.wishlist');
}
    
}
