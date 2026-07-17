<?php

use App\Http\Controllers\Api\InternalUploadController;
use App\Http\Controllers\Api\PushNotificationController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Upload API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::post('/internal-upload', [InternalUploadController::class, 'upload']);

Route::post('/custom-field-upload', [InternalUploadController::class, 'customFieldUpload']);

Route::post('/listing-image-upload',[InternalUploadController::class, 'listingImageUpload']);

Route::post('/inventory-image-upload',[InternalUploadController::class, 'inventoryImageUpload']);

Route::post('/qrcode-image-upload',[InternalUploadController::class, 'qrcodeImageUpload']);

Route::post( '/blog-image-upload', [InternalUploadController::class, 'blogImageUpload'] );

// Future-ready: external systems can trigger FCM push (header: X-Push-Api-Key)
Route::post('/push/notify', [PushNotificationController::class, 'send']);

