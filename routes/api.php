<?php

use App\Http\Controllers\Api\InternalUploadController;
use App\Http\Controllers\Api\MobileAuthController;
use App\Http\Controllers\Api\MobileFcmController;
use App\Http\Controllers\Api\PushNotificationController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

Route::post('/internal-upload', [InternalUploadController::class, 'upload']);
Route::post('/custom-field-upload', [InternalUploadController::class, 'customFieldUpload']);
Route::post('/listing-image-upload', [InternalUploadController::class, 'listingImageUpload']);
Route::post('/inventory-image-upload', [InternalUploadController::class, 'inventoryImageUpload']);
Route::post('/qrcode-image-upload', [InternalUploadController::class, 'qrcodeImageUpload']);
Route::post('/blog-image-upload', [InternalUploadController::class, 'blogImageUpload']);

/*
|--------------------------------------------------------------------------
| Mobile App — Auth + Push Notification APIs
| Base URL: https://www.listify.asia/api
|--------------------------------------------------------------------------
*/

// Public
Route::post('/auth/login', [MobileAuthController::class, 'login']);

// Protected (Authorization: Bearer {token})
Route::middleware('auth.api')->group(function () {
    Route::get('/auth/me', [MobileAuthController::class, 'me']);
    Route::post('/auth/logout', [MobileAuthController::class, 'logout']);

    Route::post('/fcm/register', [MobileFcmController::class, 'register']);
    Route::delete('/fcm/unregister', [MobileFcmController::class, 'unregister']);
    Route::post('/fcm/unregister', [MobileFcmController::class, 'unregister']); // alias for clients without DELETE
    Route::get('/fcm/devices', [MobileFcmController::class, 'devices']);
    Route::post('/fcm/test', [MobileFcmController::class, 'test']);
});

// Server-to-server test/send (header: X-Push-Api-Key = FIREBASE_PUSH_API_KEY)
Route::post('/push/notify', [PushNotificationController::class, 'send']);
