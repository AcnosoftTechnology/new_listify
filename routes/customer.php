<?php

use App\Http\Controllers\Agent\AgentController;
use App\Http\Controllers\Customer\CustomerController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Home Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::prefix('{prefix}')->controller(CustomerController::class)->middleware('auth')->group(function () {
    // GET = open chat page (was wrongly POST → caused /agent/messages 404)
    Route::get('/messages/{id?}/{code?}', 'user_messages')->name('user.messages');
    Route::post('/messages/{code?}', 'send_message')->name('user.message.send');
});

Route::controller(CustomerController::class)->middleware('auth', 'customer')->group(function () {
    Route::get('/customer/wishlist', 'wishlist')->name('customer.wishlist');
    Route::get('/customer/remove/wishlist/{id}', 'remove_wishlist')->name('customer.remove.wishlist');
    Route::get('/customer/appointment', 'appointment')->name('customer.appointment');
    Route::get('/customer/become-an-agent', 'become_an_agent')->name('customer.become_an_agent');
    Route::get('/customer/following-agent', 'following_agent')->name('customer.following-agent');
    Route::get('/customer/following-remove/{id}', 'following_agent_remove')->name('customer.remove.follow_agent');

    Route::get('/customer/invoice', 'invoice')->name('customer.invoice');
    Route::get('/customer/invoice/create', 'createInvoice')->name('customer.invoice.create');
    Route::post('/customer/invoice/store', 'storeInvoice')->name('customer.invoice.store');
    Route::get('/customer/invoice/edit/{id}', 'editInvoice')->name('customer.invoice.edit');
    Route::post('/customer/invoice/update/{id}', 'updateInvoice')->name('customer.invoice.update');
    
 
    Route::get('/customer/my-crm', [CustomerController::class, 'mycrm'])->name('customer.mycrm');
    Route::get('/customer/my-notifications', [CustomerController::class, 'notification'])->name('customer.notification');
    Route::get('/customer/my-notifications/read', [CustomerController::class, 'markAsRead'])->name('customer.notification.read');
    Route::get('/customer/my-notifications/delete', [CustomerController::class, 'deleteNotification'])->name('customer.notification.delete');

    Route::get('/customer/qrcode', [CustomerController::class, 'qrcode'])->name('customer.qrcode');
    Route::get('/customer/qrcode/add', [CustomerController::class, 'addqrcode'])->name('customer.addqr');
    Route::post('/customer/store-qrcode', [CustomerController::class, 'storeqrcode'])->name('customer.storeqrcode');
    Route::get('/customer/qrcode/edit/{id}', [CustomerController::class, 'qredit'])->name('customer.qrcode.editqr');
    Route::put('/customer/qrcode/update/{id}', [CustomerController::class, 'updateqrcode'])->name('customer.qrcode.update');
    Route::delete('/customer/qrcode/{id}', [CustomerController::class, 'destroy'])->name('customer.qrcode.destroy');
  


    Route::get('/customer/appointment/status/{id}',  [AgentController::class, 'appointment_delete'])->name('customer.appointment.delete');
    Route::get('/customer/appointment/details/{id}/{type}',  [AgentController::class, 'appointment_view_details'])->name('customer.appointment.view_details');

});