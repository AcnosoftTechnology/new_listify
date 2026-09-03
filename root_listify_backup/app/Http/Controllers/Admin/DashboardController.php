<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\CustomListings;
use App\Models\BeautyListing;
use App\Models\HotelListing;
use App\Models\RealEstateListing;
use App\Models\RestaurantListing;
use App\Models\CarListing;
use App\Models\CustomType;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class DashboardController extends Controller{
  
    public function index(){
        $page_data['users'] = User::where('role',2)->get();
        return view('admin.dashboard',$page_data);
    }  
  
public function allListings($type){
  
    $listings = collect();

    $staticTables = [
        'beauty'      => BeautyListing::class,
        'hotel'       => HotelListing::class,
        'restaurant'  => RestaurantListing::class,
        'real-estate' => RealEstateListing::class,
        'car'         => CarListing::class,
    ];

    if (array_key_exists($type, $staticTables)) {

        $model = $staticTables[$type];

        $listings = $model::select(
                'id',
                'title',
                'description',
                'visibility'
            )
            ->paginate(10);

    } else {

        $listings = CustomListings::where('type', $type)
            ->select(
                'id',
                'title',
                'description',
                'visibility',
                'type'
            )
            ->paginate(10);
    }

    return view('admin.all-listings', compact('type', 'listings'));
}
  
  
}
