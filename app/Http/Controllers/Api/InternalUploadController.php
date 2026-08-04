<?php

namespace App\Http\Controllers\Api;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

use App\Http\Controllers\Controller;
use App\Models\User;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\BeautyListing;
use Illuminate\Support\Facades\Session;

class InternalUploadController extends Controller{

  
  
  public function upload(Request $request){
    
    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([
                'status' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | CHECK FILE
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('image')) {

            return response()->json([
                'status' => false,
                'message' => 'Image not found',
                'all' => $request->all(),
                'files' => $_FILES
            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | IMAGE
        |--------------------------------------------------------------------------
        */

        $image = $request->file('image');

        /*
        |--------------------------------------------------------------------------
        | IMAGE NAME
        |--------------------------------------------------------------------------
        */

        $imageName = time() . '_' . rand(1111,9999) . '.' . $image->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | PATH
        |--------------------------------------------------------------------------
        */

        $destinationPath = public_path('uploads/users');

        /*
        |--------------------------------------------------------------------------
        | CREATE FOLDER
        |--------------------------------------------------------------------------
        */

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE IMAGE
        |--------------------------------------------------------------------------
        */

        $image->move($destinationPath, $imageName);

        /*
        |--------------------------------------------------------------------------
        | SUCCESS RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'image' => $imageName,

            'url' => 'https://www.listify.asia/public/uploads/users/' . $imageName

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}
  
  
  
  
public function customFieldUpload(Request $request){
  
    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([
                'status' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | CHECK FILE
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([
                'status' => false,
                'message' => 'File not found'
            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename = time() . '_' . rand(1111,9999) . '.' . $file->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | PATH
        |--------------------------------------------------------------------------
        */

        $destinationPath = public_path('uploads/custom-fields');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file' => $filename,

            'url' => 'https://www.listify.asia/public/uploads/custom-fields/' . $filename

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}  
  
  

  
public function listingImageUpload(Request $request){

    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([
                'status' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | CHECK FILE
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([
                'status' => false,
                'message' => 'File not found'
            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename =
            rand(0,9) .
            '-' .
            time() .
            '.' .
            $file->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | PATH
        |--------------------------------------------------------------------------
        */

        $destinationPath = public_path('uploads/listing-images');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file' => $filename,

            'url' =>
                'https://www.listify.asia/public/uploads/listing-images/' .
                $filename

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}

  
  
  

public function inventoryImageUpload(Request $request){
    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([
                'status' => false,
                'message' => 'Unauthorized'
            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | CHECK FILE
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([
                'status' => false,
                'message' => 'File not found'
            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename =
            time() .
            '_' .
            rand(1111,9999) .
            '.' .
            $file->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | PATH
        |--------------------------------------------------------------------------
        */

        $destinationPath =
            public_path('uploads/inventory');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file' => $filename,

            'url' =>
                'https://www.listify.asia/public/uploads/inventory/' .
                $filename

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}

  

public function qrcodeImageUpload(Request $request){

    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([

                'status' => false,

                'message' => 'Unauthorized'

            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE CHECK
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([

                'status' => false,

                'message' => 'File not found'

            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename =
            time() . '.' .
            $file->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | DESTINATION
        |--------------------------------------------------------------------------
        */

        $destinationPath =
            public_path('uploads/qrcodes');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file' => $filename,

            'url' =>
                'https://www.listify.asia/public/uploads/qrcodes/' .
                $filename

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}
  
  

public function blogImageUpload(Request $request){

    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([

                'status' => false,

                'message' => 'Unauthorized'

            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE CHECK
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([

                'status' => false,

                'message' => 'File not found'

            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename =
            time() . '.png';

        /*
        |--------------------------------------------------------------------------
        | DESTINATION
        |--------------------------------------------------------------------------
        */

        $destinationPath =
            public_path('uploads/blog-images');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file' => $filename,

            'url' =>
                'https://www.listify.asia/public/uploads/blog-images/' .
                $filename

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}

 
public function paymentImageUpload(Request $request){

    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([

                'status' => false,

                'message' => 'Unauthorized'

            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE CHECK
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([

                'status' => false,

                'message' => 'File not found'

            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename =
            time() . '.' .
            $file->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | DESTINATION
        |--------------------------------------------------------------------------
        */

        $destinationPath =
            public_path('uploads/paymentscreenshort');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file'   => $filename,

            'url' =>
                'https://www.listify.asia/public/uploads/paymentscreenshort/' .
                $filename

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status'  => false,

            'message' => $e->getMessage()

        ], 500);
    }
}

public function chatImageUpload(Request $request)
{
    try {

        /*
        |--------------------------------------------------------------------------
        | SECRET CHECK
        |--------------------------------------------------------------------------
        */

        if ($request->secret != env('INTERNAL_UPLOAD_SECRET')) {

            return response()->json([

                'status' => false,

                'message' => 'Unauthorized'

            ], 401);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE CHECK
        |--------------------------------------------------------------------------
        */

        if (!$request->hasFile('file')) {

            return response()->json([

                'status' => false,

                'message' => 'File not found'

            ], 400);
        }

        /*
        |--------------------------------------------------------------------------
        | VALIDATION
        |--------------------------------------------------------------------------
        */

        $validator = Validator::make($request->all(), [

            'file' => 'required|image|mimes:jpg,jpeg,png,webp|max:5120',

        ]);

        if ($validator->fails()) {

            return response()->json([

                'status' => false,

                'message' => $validator->errors()->first()

            ], 422);
        }

        /*
        |--------------------------------------------------------------------------
        | FILE
        |--------------------------------------------------------------------------
        */

        $file = $request->file('file');

        /*
        |--------------------------------------------------------------------------
        | FILE NAME
        |--------------------------------------------------------------------------
        */

        $filename =
            time() . '_' . uniqid() . '.' .
            $file->getClientOriginalExtension();

        /*
        |--------------------------------------------------------------------------
        | DESTINATION
        |--------------------------------------------------------------------------
        */

        $destinationPath =
            public_path('uploads/chat');

        if (!file_exists($destinationPath)) {

            mkdir($destinationPath, 0777, true);
        }

        /*
        |--------------------------------------------------------------------------
        | MOVE FILE
        |--------------------------------------------------------------------------
        */

        $file->move($destinationPath, $filename);

        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */

        return response()->json([

            'status' => true,

            'file' => $filename,

            'url' =>
                url('public/uploads/chat/' . $filename)

        ]);

    } catch (\Exception $e) {

        return response()->json([

            'status' => false,

            'message' => $e->getMessage()

        ], 500);
    }
}

  
    
}
