<?php

use App\Http\Controllers\Api\InternalUploadController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisteredUserController;

/*
|--------------------------------------------------------------------------
| API Routes (listify.asia website)
|--------------------------------------------------------------------------
| Mobile FCM / auth APIs live on api.listify.asia (JWT).
| This host keeps web session FCM at POST /fcm/token (web.php) and uploads.
*/

Route::post('/apple-login', [RegisteredUserController::class, 'appleLogin']);
Route::post('/internal-upload', [InternalUploadController::class, 'upload']);
Route::post('/custom-field-upload', [InternalUploadController::class, 'customFieldUpload']);
Route::post('/listing-image-upload', [InternalUploadController::class, 'listingImageUpload']);
Route::post('/inventory-image-upload', [InternalUploadController::class, 'inventoryImageUpload']);
Route::post('/qrcode-image-upload', [InternalUploadController::class, 'qrcodeImageUpload']);
Route::post('/blog-image-upload', [InternalUploadController::class, 'blogImageUpload']);
Route::post('/payment-image-upload', [InternalUploadController::class, 'paymentImageUpload']);
