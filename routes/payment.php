<?php

use App\Http\Controllers\OfflinePaymentController;
use App\Http\Controllers\PaymentController;
use Illuminate\Support\Facades\Route;

Route::controller(PaymentController::class)->middleware('auth')->group(function () {
    
    Route::get('payment/{id}', 'index')->name('payment');

    Route::post('payment/save-billing-details', [PaymentController::class, 'saveBillingDetails'])->name('payment.save.billing.details');

    Route::get('payment/show_payment_gateway_by_ajax/{identifier}', 'show_payment_gateway_by_ajax')->name('payment.show_payment_gateway_by_ajax');
    Route::get('payment/success/{identifier?}', 'payment_success')->name('payment.success');
    Route::get('payment/create/{identifier}', 'payment_create')->name('payment.create');
    Route::post('payment/{identifier}/subscription', 'payment_razorpay_subscription')->name('razorpay.subscription');

    // razor pay
    Route::post('payment/{identifier}/order', 'payment_razorpay')->name('razorpay.order');
    
    // PhonePe routes
    Route::post('payment/phonepe/initiate', [PaymentController::class, 'phonepeInitiate'])->name('phonepe.initiate');
    Route::get('payment/phonepe/redirect', [PaymentController::class, 'phonepeRedirect'])->name('phonepe.redirect');
    Route::post('payment/phonepe/callback', [PaymentController::class, 'phonepeCallback'])->name('phonepe.callback');

    // paytm pay
    Route::get('payment/make/paytm/order', 'make_paytm_order')->name('make.paytm.order');
    Route::get('payment/make/{identifier}/status', 'paytm_paymentCallback')->name('payment.status');

});

Route::get('payment/web_redirect_to_pay_fee', [PaymentController::class, 'webRedirectToPayFee'])->name('payment.web_redirect_to_pay_fee');

Route::post('/subscribe/free/{id}', [PaymentController::class, 'subscribeFreePackage'])->name('package.subscribe_free');