<?php

namespace App\Http\Controllers\Frontend;
use Illuminate\Support\Facades\View;
use App\Http\Controllers\Controller;
use App\Models\BeautyListing;
use App\Models\Blog;
use App\Models\CarListing;
use App\Models\Category;
use App\Models\HotelListing;
use App\Models\Pricing;
use App\Models\RealEstateListing;
use App\Models\RestaurantListing;
use App\Models\CustomType;
use App\Models\CustomListings;
use App\Models\User;
use App\Models\Message_thread;
use App\Models\Message;
use App\Models\Review;
use App\Models\Wishlist;
use App\Models\City;
use App\Models\Country;
use App\Models\Menu;
use App\Models\Appointment;
use App\Models\Amenities;
use App\Models\Newsletter;
use App\Models\Newsletter_subscriber;
use App\Models\ClaimedListing;
use App\Models\ReportedListing;
use App\Models\Contact;
use App\Models\Qrcode;
use App\Models\CustomlistingSetting;
use App\Services\GeolocationService;
use App\Services\FirebaseNotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Pagination\LengthAwarePaginator;
use DB;
use Illuminate\Support\Str;

class FrontendController extends Controller{
 
  
    /*public function index(){
   
        $userCoords = GeolocationService::getUserCoordinatesFromSession();
        $limit = 8;

        $page_data['beautyListing'] = BeautyListing::where('visibility','visible')->get();
        $page_data['restaurantListing'] = RestaurantListing::where('visibility','visible')->get();
        $page_data['realEstateListing'] = RealEstateListing::where('visibility','visible')->get();
        $page_data['hotelListing'] = HotelListing::where('visibility','visible')->get();
        $page_data['carListing'] = CarListing::where('visibility','visible')->get();
        if ($userCoords) {
            $page_data['customlistings'] = GeolocationService::sortListingsByDistance(
                CustomListings::where('visibility', 'visible')->get(),
                $userCoords['latitude'],
                $userCoords['longitude']
            );
        } else {
            $page_data['customlistings'] = CustomListings::where('visibility','visible')->orderBy('created_at', 'DESC')->get();
        }
        $page_data['categories'] = Category::all();
        $page_data['reviews'] = Review::whereNull('reply_id')->where('rating',5)->orderBy('created_at', 'DESC')->take(50)->get();

        $page_data['blogs'] = Blog::where('status', 1)->where('is_popular', 1)->orderBy('created_at', 'desc')->take(3)->get();
        $page_data['customTypes'] = CustomType::where('status', 1)->orderBy('sorting','asc')->take(5)->get();

        if ($userCoords) {
            $lat = $userCoords['latitude'];
            $lng = $userCoords['longitude'];
            $page_data['Totalhotels'] = GeolocationService::getSortedListings(HotelListing::class, $lat, $lng, $limit);
            $page_data['Totalrestaurant'] = GeolocationService::getSortedListings(RestaurantListing::class, $lat, $lng, $limit);
            $page_data['Totalbeauty'] = GeolocationService::getSortedListings(BeautyListing::class, $lat, $lng, $limit);
            $page_data['TotalrealEstate'] = GeolocationService::getSortedListings(RealEstateListing::class, $lat, $lng, $limit);
            $page_data['Totalcar'] = GeolocationService::getSortedListings(CarListing::class, $lat, $lng, $limit);
            $page_data['userHasLocation'] = true;
        } else {
            $page_data['Totalhotels'] = HotelListing::where('visibility','visible')->orderBy('created_at', 'desc')->take($limit)->get();
            $page_data['Totalrestaurant'] = RestaurantListing::where('visibility','visible')->orderBy('created_at', 'desc')->take($limit)->get();
            $page_data['Totalbeauty'] = BeautyListing::where('visibility','visible')->orderBy('created_at', 'desc')->take($limit)->get();
            $page_data['TotalrealEstate'] = RealEstateListing::where('visibility','visible')->orderBy('created_at', 'desc')->take($limit)->get();
            $page_data['Totalcar'] = CarListing::where('visibility','visible')->orderBy('created_at', 'desc')->take($limit)->get();
            $page_data['userHasLocation'] = false;
        }

        return view('frontend.index',$page_data);
    }*/

public function index(){

    $userCoords = GeolocationService::getUserCoordinatesFromSession();
    $limit = 8;

    // ======================================================
    // Filter expired listings (Admin bypass)
    // ======================================================
    $filterExpiredListings = function ($listings) {

        return $listings->filter(function ($listing) {

            $user = User::find($listing->user_id);

            // Admin ki listings hamesha show hongi
            if ($user && $user->id == 1 && $user->type == 'admin') {
                return true;
            }

            $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                ->latest('id')
                ->first();

            return $latestSubscription && $latestSubscription->status != 2;
        })->values();
    };

    $page_data['beautyListing'] = $filterExpiredListings(
        BeautyListing::where('visibility','visible')->get()
    );

    $page_data['restaurantListing'] = $filterExpiredListings(
        RestaurantListing::where('visibility','visible')->get()
    );

    $page_data['realEstateListing'] = $filterExpiredListings(
        RealEstateListing::where('visibility','visible')->get()
    );

    $page_data['hotelListing'] = $filterExpiredListings(
        HotelListing::where('visibility','visible')->get()
    );

    $page_data['carListing'] = $filterExpiredListings(
        CarListing::where('visibility','visible')->get()
    );

    if ($userCoords) {

        $page_data['customlistings'] = GeolocationService::sortListingsByDistance(
            $filterExpiredListings(
                CustomListings::where('visibility', 'visible')->get()
            ),
            $userCoords['latitude'],
            $userCoords['longitude']
        );

    } else {

        $page_data['customlistings'] = $filterExpiredListings(
            CustomListings::where('visibility','visible')
                ->orderBy('created_at', 'DESC')
                ->get()
        );
    }

    $page_data['categories'] = Category::all();
    $page_data['reviews'] = Review::whereNull('reply_id')
        ->where('rating',5)
        ->orderBy('created_at', 'DESC')
        ->take(50)
        ->get();

    $page_data['blogs'] = Blog::where('status', 1)
        ->where('is_popular', 1)
        ->orderBy('created_at', 'desc')
        ->take(3)
        ->get();

    $page_data['customTypes'] = CustomType::where('status', 1)
        ->orderBy('sorting','asc')
        ->take(5)
        ->get();

    if ($userCoords) {

        $lat = $userCoords['latitude'];
        $lng = $userCoords['longitude'];

        $page_data['Totalhotels'] = GeolocationService::getSortedListings(HotelListing::class, $lat, $lng, $limit);
        $page_data['Totalrestaurant'] = GeolocationService::getSortedListings(RestaurantListing::class, $lat, $lng, $limit);
        $page_data['Totalbeauty'] = GeolocationService::getSortedListings(BeautyListing::class, $lat, $lng, $limit);
        $page_data['TotalrealEstate'] = GeolocationService::getSortedListings(RealEstateListing::class, $lat, $lng, $limit);
        $page_data['Totalcar'] = GeolocationService::getSortedListings(CarListing::class, $lat, $lng, $limit);

        $page_data['userHasLocation'] = true;

    } else {

        $page_data['Totalhotels'] = $filterExpiredListings(
            HotelListing::where('visibility','visible')
                ->orderBy('created_at', 'desc')
                ->take($limit)
                ->get()
        );

        $page_data['Totalrestaurant'] = $filterExpiredListings(
            RestaurantListing::where('visibility','visible')
                ->orderBy('created_at', 'desc')
                ->take($limit)
                ->get()
        );

        $page_data['Totalbeauty'] = $filterExpiredListings(
            BeautyListing::where('visibility','visible')
                ->orderBy('created_at', 'desc')
                ->take($limit)
                ->get()
        );

        $page_data['TotalrealEstate'] = $filterExpiredListings(
            RealEstateListing::where('visibility','visible')
                ->orderBy('created_at', 'desc')
                ->take($limit)
                ->get()
        );

        $page_data['Totalcar'] = $filterExpiredListings(
            CarListing::where('visibility','visible')
                ->orderBy('created_at', 'desc')
                ->take($limit)
                ->get()
        );

        $page_data['userHasLocation'] = false;
    }

    return view('frontend.index', $page_data);
}    

    public function hotel_home(){

        $page_data['cities'] = City::get();
        $uniqueCountryIds = City::distinct()->pluck('country');
        $page_data['listing_countries'] = Country::whereIn('id', $uniqueCountryIds)->take(6)->get();
        $page_data['categories'] = Category::where('type','hotel')->get();

        $userCoords = GeolocationService::getUserCoordinatesFromSession();

        // Get all visible listings
        $allListings = HotelListing::where('visibility', 'visible')->get();

        // Hide expired package listings (Admin bypass)
        $listings = $allListings->filter(function ($listing) {

            $user = User::find($listing->user_id);

            // Admin bypass
            if ($user && $user->id == 1 && $user->type == 'admin') {
                return true;
            }

            $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                ->latest('id')
                ->first();

            // No subscription
            if (!$latestSubscription) {
                return false;
            }

            // Expired package
            if ($latestSubscription->status == 2) {
                return false;
            }

            return true;
        });

        if ($userCoords) {
            $page_data['top_listings'] = GeolocationService::sortListingsByDistance(
                $listings,
                $userCoords['latitude'],
                $userCoords['longitude']
            );
        } else {
            $page_data['top_listings'] = $listings->sortByDesc('created_at')->values();
        }

        $page_data['directory'] = 'hotel';

        return view('frontend.hotel.home', $page_data);
    }  

    public function car_home(){
        $page_data['categories'] = Category::where('type','car')->get();

        $allListings = CarListing::orderBy('id', 'desc')
            ->where('visibility', 'visible')
            ->get();

        $page_data['top_listings'] = $allListings->filter(function ($listing) {

            $user = User::find($listing->user_id);

            if ($user && $user->id == 1 && $user->type == 'admin') {
                return true;
            }

            $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                ->latest('id')
                ->first();

            return $latestSubscription && $latestSubscription->status != 2;
        })->values();

        $page_data['directory'] = 'car';

        return view('frontend.car.home', $page_data);
    }

    public function beauty_home(){
        $page_data['BeautyPopular'] = BeautyListing::orderBy('id','desc')
            ->where('visibility','visible')
            ->where('is_popular','popular')
            ->get()
            ->filter(function ($listing) {

                $user = User::find($listing->user_id);

                if ($user && $user->id == 1 && $user->type == 'admin') {
                    return true;
                }

                $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                    ->latest('id')
                    ->first();

                return $latestSubscription && $latestSubscription->status != 2;
            })
            ->take(4)
            ->values();

        $page_data['BeautyBest'] = BeautyListing::orderBy('id','desc')
            ->where('visibility','visible')
            ->where('is_popular','best')
            ->get()
            ->filter(function ($listing) {

                $user = User::find($listing->user_id);

                if ($user && $user->id == 1 && $user->type == 'admin') {
                    return true;
                }

                $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                    ->latest('id')
                    ->first();

                return $latestSubscription && $latestSubscription->status != 2;
            })
            ->take(4)
            ->values();

        $page_data['BeautyWellness'] = BeautyListing::orderBy('id','desc')
            ->where('visibility','visible')
            ->where('is_popular','wellness')
            ->get()
            ->filter(function ($listing) {

                $user = User::find($listing->user_id);

                if ($user && $user->id == 1 && $user->type == 'admin') {
                    return true;
                }

                $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                    ->latest('id')
                    ->first();

                return $latestSubscription && $latestSubscription->status != 2;
            })
            ->take(4)
            ->values();

        $page_data['directory'] = 'beauty';

        return view('frontend.beauty.home', $page_data);
    }

    public function doctor_home(){

        $allListings = HotelListing::orderBy('id','desc')
            ->where('visibility','visible')
            ->get();

        $page_data['top_listings'] = $allListings->filter(function ($listing) {

            $user = User::find($listing->user_id);

            if ($user && $user->id == 1 && $user->type == 'admin') {
                return true;
            }

            $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                ->latest('id')
                ->first();

            return $latestSubscription && $latestSubscription->status != 2;
        })->take(4)->values();

        $page_data['directory'] = 'doctor';

        return view('frontend.doctor.home', $page_data);
    }
  
    public function realestate_home(){

        $page_data['categories'] = Category::where('type','real-estate')->get();

        $cityIdsWithListings = RealEstateListing::distinct()->pluck('city');
        $page_data['listing_cities'] = City::whereIn('id', $cityIdsWithListings)->take(4)->get();

        $allListings = RealEstateListing::orderBy('id','desc')
            ->where('visibility','visible')
            ->get();

        $page_data['top_listings'] = $allListings->filter(function ($listing) {

            $user = User::find($listing->user_id);

            if ($user && $user->id == 1 && $user->type == 'admin') {
                return true;
            }

            $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                ->latest('id')
                ->first();

            return $latestSubscription && $latestSubscription->status != 2;
        })->values();

        $page_data['directory'] = 'real-estate';

        return view('frontend.real-estate.home', $page_data);
    }
  
    public function restaurant_home(){

        $countryIdsWithListings = RestaurantListing::distinct()->pluck('country');
        $page_data['countries'] = Country::whereIn('id', $countryIdsWithListings)->take(4)->get();

        $cityIdsWithListings = RestaurantListing::distinct()->pluck('city');
        $page_data['cities'] = City::whereIn('id', $cityIdsWithListings)->take(4)->get();

        $page_data['categories'] = Category::where('type','real-estate')->get();

        $allListings = RestaurantListing::orderBy('id','desc')
            ->where('visibility','visible')
            ->get();

        $page_data['top_listings'] = $allListings->filter(function ($listing) {

            $user = User::find($listing->user_id);

            if ($user && $user->id == 1 && $user->type == 'admin') {
                return true;
            }

            $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)
                ->latest('id')
                ->first();

            return $latestSubscription && $latestSubscription->status != 2;
        })->values();

        $page_data['directory'] = 'restaurant';

        return view('frontend.restaurant.home', $page_data);
    }



  
   /* public function listing_view($type, $view){
            $page_data['type'] = $type;
            $page_data['view'] = $view;

            if ($type == 'car') {
                $query = CarListing::where('visibility', 'visible');
                $page_data['listings'] = $this->paginateListingsByDistance($query);
                $page_data['directory'] = 'car';
                $bladePath = 'frontend.car.'.$view.'_listing';
            } elseif ($type == 'beauty') {
                $query = BeautyListing::where('visibility', 'visible');
                $page_data['listings'] = $this->paginateListingsByDistance($query);
                $page_data['directory'] = 'beauty';
                $bladePath = 'frontend.beauty.'.$view.'_listing';
            } elseif ($type == 'hotel') {
                $query = HotelListing::where('visibility', 'visible');
                $page_data['listings'] = $this->paginateListingsByDistance($query);
                $page_data['directory'] = 'hotel';
                $bladePath = 'frontend.hotel.'.$view.'_listing';
            } elseif ($type == 'real-estate') {
                $query = RealEstateListing::where('visibility', 'visible');
                $page_data['listings'] = $this->paginateListingsByDistance($query);
                $page_data['directory'] = 'real-estate';
                $bladePath = 'frontend.real-estate.'.$view.'_listing';
            } elseif ($type == 'restaurant') {
                $query = RestaurantListing::where('visibility', 'visible');
                $page_data['listings'] = $this->paginateListingsByDistance($query);
                $page_data['directory'] = 'restaurant';
                $bladePath = 'frontend.restaurant.'.$view.'_listing';
            } elseif ($type == 'doctor') {
                $page_data['listings'] = User::where('type', 'doctor')->paginate(9);
                $page_data['directory'] = 'doctor';
                $bladePath = 'frontend.doctor.'.$view.'_listing';
            }else {

                // Slug (travel-tourism) se customlisting_setting ka data lao
                $page_data['CustomlistingSetting'] = \App\Models\CustomlistingSetting::where('slug', $type)->first();

                // Custom Listings
                $query = CustomListings::where('visibility', 'visible')
                            ->where('type', $type);

                $page_data['listings'] = $this->paginateListingsByDistance($query);
                $page_data['directory'] = 'custom-types';
                $bladePath = 'frontend.custom-types.'.$view.'_listing';
             }

            $page_data['categories'] = Category::where('type', $type)->get();

            return view($bladePath, $page_data);
 }*/


            public function listing_view($type, $view){
    $page_data['type'] = $type;
    $page_data['view'] = $view;

    // ======================================================
    // Expired users (Admin excluded)
    // ======================================================
    $expiredUserIds = \App\Models\Subscription::where('status', 2)
        ->whereNotIn('user_id', function ($query) {
            $query->select('user_id')
                ->from('subscriptions')
                ->where('status', 1);
        })
        ->pluck('user_id')
        ->toArray();

    if ($type == 'car') {
        $query = CarListing::where('visibility', 'visible')
            ->where(function ($q) use ($expiredUserIds) {
                $q->whereNotIn('user_id', $expiredUserIds)
                  ->orWhere('user_id', 1); // Admin
            });

        $page_data['listings'] = $this->paginateListingsByDistance($query);
        $page_data['directory'] = 'car';
        $bladePath = 'frontend.car.'.$view.'_listing';

    } elseif ($type == 'beauty') {

        $query = BeautyListing::where('visibility', 'visible')
            ->where(function ($q) use ($expiredUserIds) {
                $q->whereNotIn('user_id', $expiredUserIds)
                  ->orWhere('user_id', 1);
            });

        $page_data['listings'] = $this->paginateListingsByDistance($query);
        $page_data['directory'] = 'beauty';
        $bladePath = 'frontend.beauty.'.$view.'_listing';

    } elseif ($type == 'hotel') {

        $query = HotelListing::where('visibility', 'visible')
            ->where(function ($q) use ($expiredUserIds) {
                $q->whereNotIn('user_id', $expiredUserIds)
                  ->orWhere('user_id', 1);
            });

        $page_data['listings'] = $this->paginateListingsByDistance($query);
        $page_data['directory'] = 'hotel';
        $bladePath = 'frontend.hotel.'.$view.'_listing';

    } elseif ($type == 'real-estate') {

        $query = RealEstateListing::where('visibility', 'visible')
            ->where(function ($q) use ($expiredUserIds) {
                $q->whereNotIn('user_id', $expiredUserIds)
                  ->orWhere('user_id', 1);
            });

        $page_data['listings'] = $this->paginateListingsByDistance($query);
        $page_data['directory'] = 'real-estate';
        $bladePath = 'frontend.real-estate.'.$view.'_listing';

    } elseif ($type == 'restaurant') {

        $query = RestaurantListing::where('visibility', 'visible')
            ->where(function ($q) use ($expiredUserIds) {
                $q->whereNotIn('user_id', $expiredUserIds)
                  ->orWhere('user_id', 1);
            });

        $page_data['listings'] = $this->paginateListingsByDistance($query);
        $page_data['directory'] = 'restaurant';
        $bladePath = 'frontend.restaurant.'.$view.'_listing';

    } elseif ($type == 'doctor') {

        $page_data['listings'] = User::where('type', 'doctor')->paginate(9);
        $page_data['directory'] = 'doctor';
        $bladePath = 'frontend.doctor.'.$view.'_listing';

    } else {

        // Slug (travel-tourism) se customlisting_setting ka data lao
        $page_data['CustomlistingSetting'] = \App\Models\CustomlistingSetting::where('slug', $type)->first();

        // Custom Listings
        $query = CustomListings::where('visibility', 'visible')
                    ->where('type', $type)
                    ->where(function ($q) use ($expiredUserIds) {
                        $q->whereNotIn('user_id', $expiredUserIds)
                          ->orWhere('user_id', 1);
                    });

        $page_data['listings'] = $this->paginateListingsByDistance($query);
        $page_data['directory'] = 'custom-types';
        $bladePath = 'frontend.custom-types.'.$view.'_listing';
    }

    $page_data['categories'] = Category::where('type', $type)->get();

    return view($bladePath, $page_data);
}



public function listing_details($type, $id, $slug){
            
            $whatsapp_no = null;

            if ($type == 'car') {
                $page_data['listing'] = CarListing::where('id', $id)->first();
                $page_data['directory'] = 'car';
            } elseif ($type == 'beauty') {
                $page_data['listing'] = BeautyListing::where('id', $id)->first();
                $page_data['directory'] = 'beauty';
            } elseif ($type == 'hotel') {
                $page_data['listing'] = HotelListing::where('id', $id)->first();
                $page_data['directory'] = 'hotel';
            } elseif ($type == 'real-estate') {
                $page_data['listing'] = RealEstateListing::where('id', $id)->first();
                $page_data['directory'] = 'real-estate';
            } elseif ($type == 'restaurant') {
                $page_data['listing'] = RestaurantListing::where('id', $id)->first();
                $page_data['directory'] = 'restaurant';
            } else {
                $page_data['listing'] = CustomListings::where('type', $type)
                    ->where('id', $id)
                    ->first();
                $page_data['directory'] = 'custom-types';
            }

            // Listing not found
            if (!$page_data['listing']) {
                abort(404);
            }

            $user_id = $page_data['listing']->user_id;

            // ======================================================
            // Hide listing if user has no active package
            // Admin bypass
            // ======================================================

            $user = User::find($user_id);

            if (!($user && $user->id == 1 && $user->type == 'admin')) {

                $hasActivePackage = \App\Models\Subscription::where('user_id', $user_id)
                    ->where('status', 1)
                    ->exists();

                if (!$hasActivePackage) {
                    abort(404);
                }
            }

            // Active Subscription
            $activeSubscription = \App\Models\Subscription::where('user_id', $user_id)
                ->where('status', 1)
                ->latest('id')
                ->first();

            // WhatsApp only for paid packages
            $page_data['show_whatsapp'] = $activeSubscription && $activeSubscription->package_id != 11;

            $user_whatsno = User::find($user_id);
            $user_qr      = Qrcode::where('user_id', $user_id)->first();
            $user_name    = User::select('id', 'name')->find($user_id);

            $whatsapp_no = $user_whatsno ? $user_whatsno->whatsapp : null;
            $current_user_id = auth()->id();

            $page_data['whatsapp_no'] = $whatsapp_no;
            $page_data['type'] = $type;
            $page_data['listing_id'] = $id;
            $page_data['user_id'] = $user_id;
            $page_data['user_name'] = $user_name;
            $page_data['user_qr'] = $user_qr;
            $page_data['current_user_id'] = $current_user_id;

            if ($page_data['directory'] === 'custom-types') {
                $customView = 'frontend.custom-types.details_' . $type;
                $defaultView = 'frontend.custom-types.details_';
                $viewPath = View::exists($customView) ? $customView : $defaultView;
            } else {
                $viewPath = 'frontend.' . $type . '.details_' . $type;
            }

            return view($viewPath, $page_data);
        }


    public function pricing(){
        $page_data['packages'] = Pricing::get();
        return view('frontend.pricing', $page_data);
    }

    public function blogs(){
        $page_data['blogs'] = Blog::where('status', 1)->paginate(10);
        return view('frontend.blogs', $page_data);
    }

    public function blog_details($id, $slug){
        $page_data['blog'] = Blog::where('id', $id)->first();
        return view('frontend.blog_details', $page_data);
    }
    public function blog_category($category, $slug){
        $page_data['blogs'] = Blog::where('category', $category)->where('status', 1)->paginate(10);
        return view('frontend.blogs', $page_data);
    }
    public function blog_search(Request $request){
        $request->validate([
            'search' => 'required|string|max:255',
        ]);    
        $page_data['blogs'] = Blog::where('title', 'like', '%' . $request->search . '%')->where('status', 1)->paginate(10);
        return view('frontend.blogs', $page_data);
    }



    // Reviews System 
    public function ListingReviews(Request $request, $listing_id){
    if (!Auth::check()) {
        Session::flash('warning', get_phrase('Please Login First!'));
        return redirect()->route('login');
    }
    
    // Validate input
    $request->validate([
        'rating' => 'required|integer', 
        'review' => 'required|string',
    ]);

    // Create new review
    $review = new Review;
    $review->rating = $request->rating; 
    $review->review = sanitize($request->review);
    $review->type = sanitize($request->listing_type);
    $review->agent_id = sanitize($request->agent_id);
    $review->user_id = auth()->user()->id;
    $review->listing_id = $listing_id;
    $review->save();

    Session::flash('success', get_phrase('Your review was successfully submitted!'));
    return redirect()->back();
}


    public function ListingReviewsUpdate(Request $request, $listing_id){       

        $data=$request->all();
        $review=Review::where('user_id',auth()->user()->id)->where('listing_id',$listing_id)->first();
        $editReview=Review::find($review->id);
        $editReview->rating=sanitize($data['rating']);
        $editReview->review=sanitize($data['review']);
        $editReview->save();
        Session::flash('success', get_phrase('Your review was update successfully!'));
        return redirect()->back();

    }

    public function ListingReviewsReply(Request $request, $listing_id){

        $data=$request->all();
        $review= new Review;
        $review['review']=sanitize($data['review']);
        $review['type']=sanitize($data['listing_types']);
        $review['agent_id']=sanitize($data['agent_id']);
        $review['user_id']= auth()->user()->id;
        $review['listing_id']=$listing_id;
        $review['reply_id']=sanitize($data['reply_id']);
        $review->save();
        Session::flash('success', get_phrase('Your review was successfully submitted!'));
        return redirect()->back();
    }

    public function ListingReviewsEdit($id){
        $page_data['ReviewEdit'] = Review::where('id', $id)->first();
        return view('frontend.edit-review', $page_data);
    }

    public function ListingOwnReviewsUpdated(Request $request, $id)
    {
        $data = $request->all();
        $review = Review::findOrFail($id);
        $review->review = sanitize($data['update_review']);
        $review->save();
        Session::flash('success', get_phrase('Your review was successfully submitted!'));
        return redirect()->back();
    }

    public function ListingOwnReviewsDelete($id){
        $review = Review::where('id', $id)->first();
        review::where('id', $id)->delete(); 
        Session::flash('success', get_phrase('Review deleted successfully!'));
        return redirect()->back();
    }

    // Wishlist 

    public function updateWishlist(Request $request)
    {
        $validated = $request->validate([
            'listing_id' => 'required|integer',
            'type' => 'required|string',
            'user_id' => 'required|integer',
        ]);
        try {
            $wishlist = Wishlist::where('listing_id', $validated['listing_id'])
                ->where('user_id', $validated['user_id'])
                ->first();
            if ($wishlist) {
                $wishlist->delete(); 
                $message = 'Wishlist removed';
                $status = 'success'; 
            } else {
                Wishlist::create($validated); 
                $message = 'Wishlist added!';
                $status = 'success'; 
            }
            if ($request->ajax()) {
                return response()->json(['status' => $status, 'message' => $message]);
            }
            return redirect()->back();
        } catch (\Exception $e) {
            $errorMessage = $e->getMessage();
            if ($request->ajax()) {
                return response()->json(['status' => 'error', 'message' => $errorMessage], 500);
            }
            return redirect()->back()->withErrors(['error' => $errorMessage]);
        }
    }


    public function followUnfollow(Request $request){
        $loggedInUser = auth()->user(); 
        $followedUserId = $request->input('agent_id'); 
        if (!$loggedInUser || !$followedUserId) {
            return response()->json(['status' => 0, 'message' => 'Invalid request']);
        }
        $following = json_decode($loggedInUser->following_agent, true) ?? [];
        if (in_array($followedUserId, $following)) {
            $following = array_filter($following, function ($id) use ($followedUserId) {
                return $id != $followedUserId;
            });
            $status = 0; 
            $message = 'Unfollowed';
        } else {
            $following[] = $followedUserId;
            $status = 1; 
            $message = 'Followed';
        }
        $loggedInUser->following_agent = json_encode(array_values($following));
        $loggedInUser->save();
        return response()->json(['status' => $status, 'message' => $message, 'followed_user_id' => $followedUserId]);
    }
    
    

public function customerMessage(Request $request){
    if (!Auth::check()) {
        return response()->json([
            'status' => 'error',
            'message' => get_phrase('Please login first'),
        ], 401);
    }

    $message = sanitize((string) $request->input('message', ''));
    $receiver = (int) $request->input('agent_id');
    $sender = (int) auth()->id();

    /*
    |--------------------------------------------------------------------------
    | IMAGE UPLOAD LOGIC
    |--------------------------------------------------------------------------
    */

    $imagePath = null;

    if ($request->hasFile('attachment')) {

        $request->validate([
            'attachment' => 'image|mimes:png,jpg,jpeg,webp|max:5120',
        ]);

        $image = $request->file('attachment');

        $fileName = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();

        $destinationPath = public_path('uploads/chat');

        if (!file_exists($destinationPath)) {
            mkdir($destinationPath, 0777, true);
        }

        $image->move($destinationPath, $fileName);

        $imagePath = 'uploads/chat/' . $fileName;
    }

    /*
    |--------------------------------------------------------------------------
    | MESSAGE VALIDATION
    |--------------------------------------------------------------------------
    */

    if ($message === '' && empty($imagePath)) {
        return response()->json([
            'status' => 'error',
            'message' => get_phrase('Message or image is required'),
        ], 422);
    }

    if ($receiver <= 0) {
        return response()->json([
            'status' => 'error',
            'message' => get_phrase('Invalid user'),
        ], 422);
    }

    if ($sender === $receiver) {
        return response()->json([
            'status' => 'error',
            'message' => get_phrase("You can't message yourself"),
        ], 422);
    }

    /*
    |--------------------------------------------------------------------------
    | ASIA/KOLKATA TIMEZONE
    |--------------------------------------------------------------------------
    */

    $kolkataNow = Carbon::now('Asia/Kolkata');

    $thread = Message_thread::where(function ($q) use ($sender, $receiver) {
        $q->where('sender', $sender)->where('receiver', $receiver);
    })->orWhere(function ($q) use ($sender, $receiver) {
        $q->where('sender', $receiver)->where('receiver', $sender);
    })->first();

    if (!$thread) {
        $thread = new Message_thread();
        $thread->message_thread_code = substr(md5((string) rand(100000000, 20000000000)), 0, 15);
        $thread->sender = $sender;
        $thread->receiver = $receiver;

        // Save created_at in Asia/Kolkata timezone
        $thread->created_at = $kolkataNow;
        $thread->updated_at = $kolkataNow;

        $thread->save();
    }

    $dataMessage = new Message();
    $dataMessage->message_thread_code = $thread->message_thread_code;

    /*
    |--------------------------------------------------------------------------
    | SAVE TEXT OR IMAGE PATH
    |--------------------------------------------------------------------------
    */

    if (!empty($imagePath)) {
        $dataMessage->message = $imagePath;
    } else {
        $dataMessage->message = $message;
    }

    $dataMessage->sender = $sender;
    $dataMessage->read_status = 0;

    // Save message created_at in Asia/Kolkata timezone
    $dataMessage->created_at = $kolkataNow;
    $dataMessage->updated_at = $kolkataNow;

    $dataMessage->save();

    // Update thread time in Asia/Kolkata timezone
    $thread->updated_at = $kolkataNow;
    $thread->save();

    try {

        $notificationMessage = !empty($imagePath)
            ? '📷 Image'
            : $message;

        app(FirebaseNotificationService::class)->notifyChatMessage(
            $sender,
            $receiver,
            $notificationMessage,
            (string) $thread->message_thread_code
        );

    } catch (\Throwable $e) {
        Log::warning('Listing chat push failed: ' . $e->getMessage());
    }

    return response()->json([
        'code' => $thread->message_thread_code,
        'status' => 'success',
    ]);
}



    // public function customerMessage(Request $request) {
    //     if (!Auth::check()) {
    //         return response()->json([
    //             'status' => 'error',
    //             'message' => get_phrase('Please login first'),
    //         ], 401);
    //     }

    //     $message = sanitize((string) $request->input('message', ''));
    //     $receiver = (int) $request->input('agent_id');
    //     $sender = (int) auth()->id();

    //     if ($message === '' || $receiver <= 0) {
    //         return response()->json([
    //             'status' => 'error',
    //             'message' => get_phrase('Message is required'),
    //         ], 422);
    //     }

    //     if ($sender === $receiver) {
    //         return response()->json([
    //             'status' => 'error',
    //             'message' => get_phrase("You can't message yourself"),
    //         ], 422);
    //     }

    //     $thread = Message_thread::where(function ($q) use ($sender, $receiver) {
    //         $q->where('sender', $sender)->where('receiver', $receiver);
    //     })->orWhere(function ($q) use ($sender, $receiver) {
    //         $q->where('sender', $receiver)->where('receiver', $sender);
    //     })->first();

    //     if (!$thread) {
    //         $thread = new Message_thread();
    //         $thread->message_thread_code = substr(md5((string) rand(100000000, 20000000000)), 0, 15);
    //         $thread->sender = $sender;
    //         $thread->receiver = $receiver;
    //         $thread->save();
    //     }

    //     $dataMessage = new Message();
    //     $dataMessage->message_thread_code = $thread->message_thread_code;
    //     $dataMessage->message = $message;
    //     $dataMessage->sender = $sender;
    //     $dataMessage->read_status = 0;
    //     $dataMessage->save();

    //     $thread->updated_at = Carbon::now();
    //     $thread->save();

    //     // Notify vendor when customer messages from listing page
    //     try {
    //         app(FirebaseNotificationService::class)->notifyChatMessage(
    //             $sender,
    //             $receiver,
    //             $message,
    //             (string) $thread->message_thread_code
    //         );
    //     } catch (\Throwable $e) {
    //         Log::warning('Listing chat push failed: ' . $e->getMessage());
    //     }

    //     return response()->json([
    //         'code' => $thread->message_thread_code,
    //         'status' => 'success',
    //     ]);
    // }


    public function customerBookAppointment(Request $request){

        $request->validate([
            'date' => 'required|date_format:Y-m-d H:i:s',
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
        ]);

        $data = $request->all();
        if (!Auth::check()) {
            Session::flash('warning', get_phrase('Please Login First!'));
            return redirect()->back();
        }
        if (auth()->user()->id == $data['agent_id']) {
            Session::flash('warning', get_phrase("You can't book your own business!"));
            return redirect()->back();
        }
    
        $appointment_date_time = Carbon::createFromFormat('Y-m-d H:i:s', $data['date']);
        $appointment = new Appointment();
        $appointment->date = sanitize($appointment_date_time->format('Y-m-d')); 
        $appointment->time = sanitize($appointment_date_time->format('H:i:s')); 
        $appointment->type = $data['type'];
        $appointment->listing_type = sanitize($data['listing_type']);
        $appointment->listing_id = sanitize($data['listing_id']);
        $appointment->agent_id = sanitize($data['agent_id']);
        $appointment->name = sanitize($data['name']);
        $appointment->phone = sanitize($data['phone']);
        $appointment->email = sanitize($data['email']);
        $appointment->message =sanitize($data['message'] ?? 0);
        
        $appointment->status = ($data['listing_type'] == 'restaurant') ? 1 : 0;

        $appointment->customer_id = auth()->user()->id;

        $additionalInfo = [
            'adults' => $data['adults'] ?? 0,
            'children' => $data['children'] ?? 0
        ];
        $appointment->aditional_information = json_encode($additionalInfo);
        $appointment->save();
    
        Session::flash('success', get_phrase('Appointment placed successfully!'));
        return redirect()->back();
    }
    

    function get_amenity_filtered_ids($min_price, $max_price){
        $min_price = preg_replace('/[^0-9]/', '', $min_price);
        $max_price = preg_replace('/[^0-9]/', '', $max_price);
        $amenities_id = [];
        $amenities_id = Amenities::whereBetween('price', [$min_price, $max_price])->pluck('id')->toArray();
        $amenities_id = array_map('strval', $amenities_id);
        return $amenities_id;
    }

    function get_menu_filtered_ids($min_price, $max_price){
        $min_price = preg_replace('/[^0-9]/', '', $min_price);
        $max_price = preg_replace('/[^0-9]/', '', $max_price);
        $amenities_id = [];
        $amenities_id = Menu::whereBetween('price', [$min_price, $max_price])->pluck('id')->toArray();
        $amenities_id = array_map('strval', $amenities_id);
        return $amenities_id;
    }
    

    // All Filter
    public function ListingsFilter(Request $request){
      
        $listing_type = $request->type ?? 'beauty';
        $listings = null; 
      
        if ($listing_type == 'car') {
            $listings = CarListing::where('visibility', 'visible');
            $page_data['directory'] = 'car';
            if (isset($request->category) && $request->category != 'all') {
                $listings = $listings->where('category', $request->category);
                $page_data['category_type'] = sanitize($request->category);
                $page_data['activeMenu '] = sanitize($request->category);
            }
            if (isset($request->car_type) && $request->car_type != 'all') {
                $listings = $listings->where('car_type', $request->car_type);
                $page_data['car_type'] = sanitize($request->car_type);
                $page_data['activeMenu '] = sanitize($request->car_type);
            }
            if (isset($request->model) && $request->model != 'all') {
                $listings = $listings->where('model', $request->model);
                $page_data['model_type'] = sanitize($request->model);
                $page_data['activeMenu '] = sanitize($request->model);
            }
            if (isset($request->brand) && $request->brand != 'all') {
                $listings = $listings->where('brand', $request->brand);
                $page_data['brand_type'] = sanitize($request->brand);
            }
            if (isset($request->year) && $request->year != 'all') {
                $listings = $listings->where('year', $request->year);
                $page_data['year_type'] = sanitize($request->year);
            }
            if (isset($request->color) && $request->color != 'all') {
                $listings = $listings->where('exterior_color', $request->color);
                $page_data['color_type'] = sanitize($request->color);
            }
            if($request->min_price || $request->max_price ){
                $minPrice = sanitize($request->min_price);
                $maxPrice = sanitize($request->max_price);
                $listings = $listings->whereBetween('price', [$minPrice, $maxPrice]);
            }
            if (isset($request->title) && $request->title != 'all') {
                $listings = $listings->where('title', 'like', '%' . sanitize($request->title) . '%');
            }
        } elseif ($listing_type == 'beauty') {
            $listings = BeautyListing::where('visibility', 'visible');
            $page_data['directory'] = 'beauty';
            
            if (isset($request->category) && $request->category != 'all') {
                $listings = $listings->where('category', $request->category);
                $page_data['category_type'] = sanitize($request->category);
                $page_data['activeMenu '] = sanitize($request->category);
            }
           
            // Listing pricing
            $amenity_ids = $this->get_amenity_filtered_ids($request->min_price, $request->max_price);
            $listings->where(function ($query) use ($amenity_ids) {
                foreach ($amenity_ids as $id_key => $amenity_id) {
                    if($id_key == 0)
                        $query->whereJsonContains('service', $amenity_id);
                    else
                        $query->orWhereJsonContains('service', $amenity_id);
                }
            });
            // Listing pricing end
            if (isset($request->city) && $request->city != 'all') {
                $listings = $listings->where('city', $request->city);
                $page_data['city_type'] = sanitize($request->city);
            }
            if (isset($request->country) && $request->country != 'all') {
                $listings = $listings->where('country', $request->country);
                $page_data['country_type'] = sanitize($request->country);
            }
            if (isset($request->title) && $request->title != 'all') {
                $listings = $listings->where('title', 'like', '%' . sanitize($request->title) . '%');
            }

        } elseif ($listing_type == 'hotel') {
            $listings = HotelListing::where('visibility', 'visible');
            $page_data['directory'] = 'hotel';
            if (isset($request->category) && $request->category != 'all') {
                $listings = $listings->where('category', $request->category);
                $page_data['category_type'] = sanitize($request->category);
                $page_data['activeMenu '] = sanitize($request->category);
            }
            if($request->min_price || $request->max_price ){
                $minPrice = sanitize($request->min_price);
                $maxPrice = sanitize($request->max_price);
                $listings = $listings->whereBetween('price', [$minPrice, $maxPrice]);
            }
            if (isset($request->is_popular) && $request->is_popular != 'all') {
                $listings = $listings->where('is_popular', sanitize($request->is_popular));
                $page_data['status_type'] = sanitize($request->is_popular);
            }
            if (isset($request->city) && $request->city != 'all') {
                $listings = $listings->where('city', $request->city);
                $page_data['city_type'] = sanitize($request->city);
            }
            if (isset($request->country) && $request->country != 'all') {
                $listings = $listings->where('country', $request->country);
                $page_data['country_type'] = sanitize($request->country);
            }
            if (isset($request->bed) && $request->bed != 'all') {
                $listings = $listings->where('bed', $request->bed);
                $page_data['searched_bedroom'] = sanitize($request->bed);
            }
            if (isset($request->bath) && $request->bath != 'all') {
                $listings = $listings->where('bath', $request->bath);
                $page_data['searched_bathroom'] = sanitize($request->bath);
            }

            if (isset($request->title) && $request->title != 'all') {
                $listings = $listings->where('title', 'like', '%' . sanitize($request->title) . '%');
            }
           

        } elseif ($listing_type == 'real-estate') {
            $listings = RealEstateListing::where('visibility', 'visible');
            $page_data['directory'] = 'real-estate';

            if (isset($request->category) && $request->category != 'all') {
                $listings = $listings->where('category', $request->category);
                $page_data['category_type'] = sanitize($request->category);
                $page_data['activeMenu '] = sanitize($request->category);
            }
            if($request->min_price || $request->max_price ){
                $minPrice = sanitize($request->min_price);
                $maxPrice = sanitize($request->max_price);
                $listings = $listings->whereBetween('price', [$minPrice, $maxPrice]);
            }
            if (isset($request->status) && $request->status != 'all') {
                $listings = $listings->where('status', $request->status);
                $page_data['status_type'] = sanitize($request->status);
            }
            if (isset($request->bed) && $request->bed != 'all') {
                $listings = $listings->where('bed', $request->bed);
                $page_data['searched_bedroom'] = sanitize($request->bed);
            }
            if (isset($request->bath) && $request->bath != 'all') {
                $listings = $listings->where('bath', $request->bath);
                $page_data['searched_bathroom'] = sanitize($request->bath);
            }
            if (isset($request->garage) && $request->garage != 'all') {
                $listings = $listings->where('garage', $request->garage);
                $page_data['searched_garage'] = sanitize($request->bath);
            }
            if (isset($request->city) && $request->city != 'all') {
                $listings = $listings->where('city', $request->city);
                $page_data['city_type'] = sanitize($request->city);
            }
            if (isset($request->country) && $request->country != 'all') {
                $listings = $listings->where('country', sanitize($request->country));
                $page_data['country_type'] = sanitize($request->country);
            }
            
            if (isset($request->title) && $request->title != 'all') {
                $listings = $listings->where('title', 'like', '%' . sanitize($request->title) . '%');
            }

        } elseif ($listing_type == 'restaurant') {
            $listings = RestaurantListing::where('visibility', 'visible');
            $page_data['directory'] = 'restaurant';

            if (isset($request->category) && $request->category != 'all') {
                $listings = $listings->where('category', $request->category);
                $page_data['category_type'] = sanitize($request->category);
                $page_data['activeMenu '] = sanitize($request->category);
            }
            if (isset($request->city) && $request->city != 'all') {
                $listings = $listings->where('city', $request->city);
                $page_data['city_type'] = sanitize($request->city);
            }
            if (isset($request->country) && $request->country != 'all') {
                $listings = $listings->where('country', $request->country);
                $page_data['country_type'] = sanitize($request->country);
            }
             // Listing pricing
             $amenity_ids = $this->get_menu_filtered_ids($request->min_price, $request->max_price);
             $listings->where(function ($query) use ($amenity_ids) {
                 foreach ($amenity_ids as $id_key => $amenity_id) {
                     if($id_key == 0)
                         $query->whereJsonContains('menu', $amenity_id);
                     else
                         $query->orWhereJsonContains('menu', $amenity_id);
                 }
             }); 
             // Listing pricing end

             if (isset($request->title) && $request->title != 'all') {
                $listings = $listings->where('title', 'like', '%' . $request->title . '%');
            }
         

            } 
        // Dynamicaly Filter
        else{
            $listings = CustomListings::where('visibility', 'visible')->where('type', $request->type);
            $page_data['directory'] = 'custom-types'; 
             $bladePath = 'frontend.custom-types.' . $request->view . '_listing';

            if (isset($request->category) && $request->category != 'all') {
                $listings = $listings->where('category', $request->category);
                $page_data['category_type'] = sanitize($request->category);
                $page_data['activeMenu '] = sanitize($request->category);
            }
             if (isset($request->feature) && $request->feature != 'all') {
                $listings = $listings->whereJsonContains('feature', (string)$request->feature);
                $page_data['feature'] = sanitize($request->feature);
                $page_data['activeMenu '] = sanitize($request->feature);
            }
            if (isset($request->city) && $request->city != 'all') {
                $listings = $listings->where('city', $request->city);
                $page_data['city_type'] = sanitize($request->city);
            }
            if (isset($request->country) && $request->country != 'all') {
                $listings = $listings->where('country', $request->country);
                $page_data['country_type'] = sanitize($request->country);
            }
             if (isset($request->title) && $request->title != 'all') {
                $listings = $listings->where('title', 'like', '%' . sanitize($request->title) . '%');
            }



            $page_data['categories'] = Category::where('type', $request->type)->get();
            $page_data['listings'] = $this->paginateListingsByDistance($listings); 
            $page_data['type'] = $request->type ?? 'beauty';
            $page_data['view'] = $request->view;
            return view($bladePath, $page_data);
        }


        $page_data['categories'] = Category::where('type', $request->type)->get();
       
        $page_data['listings'] = $this->paginateListingsByDistance($listings); 
        $page_data['type'] = $request->type ?? 'beauty';
        $page_data['view'] = $request->view;
       
         return view('frontend.' . $page_data['type'] . '.' . $request->view . '_listing', $page_data);
    }

    /**
     * Paginate listings sorted by distance when user location is in session
     */
    private function paginateListingsByDistance($query, int $perPage = 9){
        $userCoords = GeolocationService::getUserCoordinatesFromSession();

        if (!$userCoords) {
            return $query->paginate($perPage);
        }

        $listings = $query->get();
        $sorted = GeolocationService::sortListingsByDistance(
            $listings,
            $userCoords['latitude'],
            $userCoords['longitude']
        );

        $page = LengthAwarePaginator::resolveCurrentPage();
        $items = $sorted->forPage($page, $perPage)->values();

        return new LengthAwarePaginator(
            $items,
            $sorted->count(),
            $perPage,
            $page,
            [
                'path' => LengthAwarePaginator::resolveCurrentPath(),
                'query' => request()->query(),
            ]
        );
    }
    

    // Agent Details
    public function agent_details($id, $slug){
        $page_data['users'] = User::where('id', $id)->firstOrNew();
        return view('frontend.agent_details', $page_data);
    }


    // Newsletter
    public function newslater_subscribe(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);
        $exists = Newsletter_subscriber::where('email', $request->email)->exists();
    
        if ($exists) { 
            Session::flash('warning', get_phrase('You are already subscribed!'));
            return redirect()->back();
        }
        Newsletter_subscriber::create([
            'email' => $request->email,
        ]); 
        Session::flash('success', get_phrase('Newsletter Subscribe successfully'));
        return redirect()->back();
    }
    
    
   //   Privacy policy
   public function privacy_policy(){
       return view('frontend.privacy-policy');
   }
   public function refund_policy(){
       return view('frontend.refund-policy');
   }
   public function about_us(){
       return view('frontend.about-us');
   }
   public function terms_and_condition(){
       return view('frontend.terms-and-condition');
   }
   public function contact_us(){
       return view('frontend.contact_us');
   }

   public function contact_store(Request $request)
   {
       $request->validate([
           'name' => 'required|string|max:255',
           'email' => 'required|email|max:255',
           'number' => 'required|numeric',
           'address' => 'required|string|max:255',
           'message' => 'required|string',
       ]);
       Contact::create([
           'name' => sanitize($request->name),
           'email' => sanitize($request->email),
           'phone' => sanitize($request->number),
           'address' => sanitize($request->address),
           'message' => sanitize($request->message),
           'has_read' => 0,
           'replied' => 0,
       ]);  
       Session::flash('success', get_phrase('Email Send successfully')); 
       return redirect()->back();
   }
   
    // Claim Listing
    public function claimListingForm($type, $id){
        $page_data['listing_id'] = $id;
        $page_data['type'] = $type;
        return view('frontend.claimed-form',$page_data);
    }
    public function claimListingStore(Request $request) {
        $request->validate([
            'user_name' => 'required|string|max:255',
            'user_phone' => 'required|numeric',
            'additional_info' => 'required|string',
        ]);
    
        $data = $request->all();
        $userId = auth()->user()->id;
      
        $claimListing = new ClaimedListing();
        $claimListing->listing_type = $data['claim_listing_type'];
        $claimListing->listing_id = $data['claim_listing_id'];
        $claimListing->user_id = $userId;
        $claimListing->user_name = $data['user_name'];
        $claimListing->user_phone = $data['user_phone']; 
        $claimListing->additional_info = $data['additional_info'];
        $claimListing->status = 0;
        $claimListing->save();
    
        Session::flash('success', 'Your claim request has been submitted successfully. Waiting for admin approval.');
        return redirect()->back();
    }
    
    // Report Listing Form
    public function reportListingForm($type, $id){
        $page_data['listing_id'] = $id;
        $page_data['type'] = $type;
        return view('frontend.report-form',$page_data);
    }

    public function reportListingStore(Request $request) {
        $request->validate([
            'user_name' => 'required|string|max:255',
            'user_phone' => 'required|numeric',
            'user_email' => 'required|string',
            'report' => 'required|string',
            'report_type' => 'required|string',
        ]);
    
        $data = $request->all();
        $userId = auth()->user()->id;
      
        $reportListing = new ReportedListing();
        $reportListing->type = $data['report_listing_type'];
        $reportListing->listing_id = $data['report_listing_id'];
        $reportListing->reporter_id = $userId;
        $reportListing->user_name = $data['user_name'];
        $reportListing->user_phone = $data['user_phone']; 
        $reportListing->user_email = $data['user_email']; 
        $reportListing->report = $data['report'];
        $reportListing->report_type = $data['report_type'];
        $reportListing->status = 0;
        $reportListing->save();
    
        Session::flash('success', 'Your Report request has been submitted successfully. Waiting for admin approval.');
        return redirect()->back();
    }

  
  
  
  
/* public function custom_listing($slug){    
    $listings = CustomListings::where('type', $slug)->get();
    $page_data = CustomlistingSetting::where('slug', $slug)->firstOrFail();
    return view('frontend.customlisting.home', compact('page_data', 'listings', 'slug'));
 }*/

    
 public function custom_listing($slug){
    // Pehle sab listings le lo
    $allListings = CustomListings::where('type', $slug)->get();

    // Expired users ki listings remove kar do
    $listings = $allListings->filter(function ($listing) {

        $user = User::find($listing->user_id);

        // Admin bypass
        if ($user && $user->id == 1 && $user->type == 'admin') {
            return true;
        }

        // Latest subscription
        $latestSubscription = \App\Models\Subscription::where('user_id', $listing->user_id)->latest('id')->first();

        // Agar subscription hi nahi hai to hide
        if (!$latestSubscription) {
            return false;
        }

        // Expired package hide
        if ($latestSubscription->status == 2) {
            return false;
        }

        return true;
    });

    $page_data = CustomlistingSetting::where('slug', $slug)->firstOrFail();

    return view('frontend.customlisting.home', compact('page_data', 'listings', 'slug'));
}   




public function User_profile(Request $request, $slug){

    $parts = explode('-', $slug);
    $id = array_pop($parts); 
    $namePart = implode('-', $parts);

    $user = User::find($id);
  
    if (!$user) {
        abort(404, 'User not found');
    }

    $expectedSlug = Str::slug($user->name) . '-' . $user->id;

    if ($slug !== $expectedSlug) {
        return redirect()->route('user.profile', ['slug' => $expectedSlug]);
    }

    $tables = [
        'custom_listings',
        'beauty_listings',
        'car_listings',
        'hotel_listings',
        'real_estate_listings',
        'restaurant_listings'
    ];

    $allListings = [];

    foreach ($tables as $table) {
        $listings = DB::table($table)
            ->where('user_id', $user->id)
            ->get();
        $allListings[$table] = $listings;
    }

    return view('frontend.user_profile', compact('user', 'allListings'));
}


  
  
  
 

}
