<?php

use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist; 
use App\Models\CustomListings;
use App\Models\Beauty_listing; 
use Illuminate\Support\Facades\DB;
use Mews\Purifier\Facades\Purifier;




if (!function_exists('addon_status')) {
    function addon_status($unique_identifier = '')
    {
        try {
            return DB::table('addons')->where('unique_identifier', $unique_identifier)->value('status');
        } catch (\Throwable $e) {
            return null; 
        }
    }
}

if (!function_exists('user')) {
    function user($data){
        return Auth::user()[$data]??'';
    }
}
if (!function_exists('get_image')) {
    function get_image($url)
    {
        $hostname = $_SERVER['HTTP_HOST'] ?? 'localhost';
        if ($hostname == '127.0.0.1:8000') {
            if(file_exists($url) && is_file($url)){
               $url = str_replace('app/public/', '', $url);
               return asset($url);
            }
            return asset('image/placeholder.png');
        }
        if (is_file('public/'.$url) && file_exists('public/'.$url) && $url != '') {
            $url = str_replace('app/public/', '', $url);
            return asset($url);
        }
        return asset('image/placeholder.png');
    } 
}


if (!function_exists('get_all_image')) {
    function get_all_image($url)
    {
        $path = public_path('uploads/' . $url);
        if (is_file($path) && file_exists($path) && $url != '') {
            return asset('uploads/' . $url);
        }
        return asset('image/placeholder.png');
    }
}

if (!function_exists('get_user_image')) {
    function get_user_image($url)
    {
        $path = public_path('uploads/' . $url);
        if (is_file($path) && file_exists($path) && $url != '') {
            return asset('uploads/' . $url);
        }
        return asset('image/user.jpg');
    }
}


if (! function_exists('get_settings')) {
    function get_settings($type = "", $return_type = "") {
        $value = DB::table('system_settings')->where('key', $type)->value('value');
        if($return_type === true){
            return json_decode($value, true);
        }elseif($return_type === 'decode'){
            return json_decode($value, true);
        }elseif($return_type == "object"){
            return json_decode($value);
        }else{
            return $value;
        }
    }
}
if ( ! function_exists('get_all_language'))
{
    function get_all_language(){
        return DB::table('languages')->select('name')->distinct()->get();
    }
}

if ( ! function_exists('get_phrase'))
{
    function get_phrase($phrase = '', $value_replace = array()) {
        $active_language = get_settings('language');
        Session(['active_language' => get_settings('language')]);

        $query = DB::table('languages')->where('name', $active_language)->where('phrase', $phrase);
        if($query->count() > 0){
            $tValue = $query->value('translated');
        }else{
            $tValue = $phrase;
            $all_language = get_all_language();

            if($all_language->count() > 0){
                foreach($all_language as $language){
                    if(DB::table('languages')->where('name', $language->name)->where('phrase', $phrase)->get()->count() == 0){
                        DB::table('languages')->insert(array('name' => strtolower($language->name), 'phrase' => $phrase, 'translated' => $phrase));
                    }
                }
            }else{
                DB::table('languages')->insert(array('name' => 'english', 'phrase' => $phrase, 'translated' => $phrase));
            }
        }

        if(count($value_replace) > 0){
            $translated_value_arr = explode('____', $tValue);
            $tValue = '';
            foreach($translated_value_arr as $key => $value){

                if(array_key_exists($key,$value_replace)){
                    $tValue .= $value.$value_replace[$key];
                }else{
                    $tValue .= $value;
                }
            }
        }

        return $tValue;
    }
}
if (!function_exists('slugify')) {
    function slugify($string)
    {
        $string = preg_replace('~[^\\pL\d]+~u', '-', $string);
        $string = trim($string, '-');
        return strtolower($string);
    }
}
if (!function_exists('get_frontend_settings')) {
    function get_frontend_settings($type = '', $description='')
    {
       $frontend_settings = DB::table('frontend_settings')->where('key', $type)->value('value');
        if($type == 'json') {
            $frontend_settings = json_decode($frontend_settings);
        }
        return $frontend_settings;
    }
}
if (!function_exists('currency')) {
    function currency($price = "")
    {
        $currency_position = DB::table('system_settings')->where('key', 'currency_position')->value('value');
        $code = DB::table('system_settings')->where('key', 'system_currency')->value('value');
        $symbol = DB::table('currencies')->where('id', $code)->value('symbol');

        if($currency_position == 'left'){
            return $symbol.''.$price;
        } else {
            return $price.''.$symbol;
        }
    }
}
// app/helpers.php
if (! function_exists('format_time')) {
    function format_time($time) {
        // Check if the time is a single digit or two-digit integer
        if (is_numeric($time) && (int)$time == $time) {
            $time = $time . ":00";
        }
        return date("g:i A", strtotime($time));
    }
}
// if (! function_exists('check_subscription')) {
//     function check_subscription($user_id) {
//         $subscription = App\Models\Subscription::where('user_id', $user_id)->orderBy('id','DESC')->first();
//         if($subscription){
//             if(time() > $subscription->expire_date){
//                 return 0;
//             }else{
//                 return 1;
//             }
//         }else{
//             return 0;
//         }
//     }
// }

if (!function_exists('check_subscription')) {
    function check_subscription($user_id)
    {
        $subscription = App\Models\Subscription::where('user_id', $user_id)
            ->orderBy('id', 'DESC')
            ->first();

        if (!$subscription) {
            return 0;
        }

        // Lifetime package
        if (is_null($subscription->expire_date)) {
            return 1;
        }

        // Expiry check
        if (time() > $subscription->expire_date) {
            return 0;
        }

        return 1;
    }
}



if (! function_exists('current_package')) {
    function current_package() {
        $user_id = auth()->user()->id;
        $subscription = App\Models\Subscription::where('user_id', $user_id)->orderBy('id','DESC')->first();
        
        if($subscription){
             $package_value = App\Models\Pricing::where('id', $subscription->package_id)->value('listing');
             
             if($package_value === 'Unlimited' || $package_value === 'unlimited' || $package_value === 'UNLIMITED') {
                 return 1;
             }
             
             if(empty($package_value) || !is_numeric($package_value)) {
                 return 0;
             }
            
             $beauty = App\Models\BeautyListing::where('user_id', $user_id)->count(); 
             $car = App\Models\CarListing::where('user_id', $user_id)->count(); 
             $restaurant = App\Models\RestaurantListing::where('user_id', $user_id)->count(); 
             $hotel = App\Models\HotelListing::where('user_id', $user_id)->count(); 
             $real_estate = App\Models\RealEstateListing::where('user_id', $user_id)->count();
             $custom = App\Models\CustomListings::where('user_id', $user_id)->count();

             $totalListing = $beauty + $car + $restaurant + $hotel + $real_estate + $custom;
             
             if((int)$package_value > $totalListing ){
                return 1;
             }
             return 0;
        } else {
            return 0;
        }
    }
}


if (! function_exists('nice_file_name')) {
    function nice_file_name($file_title = "", $extension = "")
    {
        return slugify($file_title) . '-' . time() . '.' . $extension;
    }
}


// Get Home page Settings Data
if (! function_exists('get_homepage_settings')) {
    function get_homepage_settings($type = "", $return_type = false)
    {
        $value = DB::table('home_page_settings')->where('key', $type);
        if ($value->count() > 0) {
            if ($return_type === true) {
                return json_decode($value->value('value'), true);
            } elseif ($return_type === "object") {
                return json_decode($value->value('value'));
            } else {
                return $value->value('value');
            }
        } else {
            return false;
        }
    }
}




if (!function_exists('check_wishlist_status')) {
    function check_wishlist_status($listing_id = '', $type = '')
    {
        if (!Auth::check()) {
            return false; 
        }
        $user_id = auth()->user()->id;
        $wishlist = DB::table('wishlists')->where('listing_id', $listing_id)->where('type', $type)->where('user_id', $user_id)->exists();  
        return $wishlist;  
    }
}


if (!function_exists('open_status')) {
    function open_status($listing_id = '', $model = ''){
        $model = 'App\Models'.'\\'.$model;
        $listing = $model::where('id', $listing_id)->first();
        if (!$listing || !$listing->opening_time) {
            return 'Closed';
        }
        $today = strtolower(now()->format('l'));
        $now = now()->format('H:i');
        $openingTimes = json_decode($listing->opening_time, true);

        if (!isset($openingTimes[$today])) {
            return 'Closed';
        }
        $todayOpening = $openingTimes[$today]['open'] ?? 'closed';
        $todayClosing = $openingTimes[$today]['close'] ?? 'closed';
        if ($todayOpening === 'closed' || $todayClosing === 'closed') {
            return 'Closed';
        }
        $todayOpening = convert_time_to_24hr($todayOpening);
        $todayClosing = convert_time_to_24hr($todayClosing);
        if ($todayClosing < $todayOpening) {
            if ($now >= $todayOpening || $now < $todayClosing) {
                return 'Open';
            }
        } else {
            if ($now >= $todayOpening && $now < $todayClosing) {
                return 'Open';
            }
        }
        return 'Closed';
    }
    function convert_time_to_24hr($time) {
        if (strpos($time, ':') === false) {
            $time .= ':00';
        }
        if (!preg_match('/^\d{1,2}:\d{2}$/', $time)) {
            return '00:00';
        }
        return date('H:i', strtotime($time));
    }
}





if (!function_exists('removeScripts')) {
    function removeScripts($text)
    {
        if (!$text) return;
        $trimConetnt = Purifier::clean($text);
        return $trimConetnt;

    }
}
if (!function_exists('sanitize')) {
    function sanitize($text)
    {
        $text = removeScripts($text);
        $text = strip_tags($text);
        return str_replace('&amp;', '&', $text);
    }
}





//start Package according validations from abhishek side.


if (!function_exists('should_show_custom_section')) {
  
    function should_show_custom_section($listing_id, $type = null) {
        try {
            
            $listingUser = null;
   
            $beautyListing = App\Models\BeautyListing::where('id', $listing_id)->first();
            $carListing = App\Models\CarListing::where('id', $listing_id)->first();
            $restaurantListing = App\Models\RestaurantListing::where('id', $listing_id)->first();
            $hotelListing = App\Models\HotelListing::where('id', $listing_id)->first();
            $realEstateListing = App\Models\RealEstateListing::where('id', $listing_id)->first();
            $customListing = App\Models\CustomListings::where('id', $listing_id)->first();
            
            if($beautyListing) $listingUser = $beautyListing->user_id;
            elseif($carListing) $listingUser = $carListing->user_id;
            elseif($restaurantListing) $listingUser = $restaurantListing->user_id;
            elseif($hotelListing) $listingUser = $hotelListing->user_id;
            elseif($realEstateListing) $listingUser = $realEstateListing->user_id;
            elseif($customListing) $listingUser = $customListing->user_id;
            
            if(!$listingUser) {
                return true; 
            }
            
 
            $subscription = App\Models\Subscription::where('user_id', $listingUser)
                ->orderBy('id','DESC')
                ->first();

            if(!$subscription || $subscription->package_id != 11) {
                return true;
            }
            
            return false;
            
        } catch (\Exception $e) {
            \Log::error('should_show_custom_section error: ' . $e->getMessage());
            return true;
        }
    }
}


if (!function_exists('should_show_sidebar')) {
    function should_show_sidebar($user_id) {
        try {
            
            $subscription = App\Models\Subscription::where('user_id', $user_id)->orderBy('id','DESC')->first();            
           
            if(!$subscription || $subscription->package_id != 11) {
                return true;
            }
            
            return false;
            
        } catch (\Exception $e) {
            \Log::error('should_show_sidebar error: ' . $e->getMessage());
            return true;
        }
    }
}


if (!function_exists('should_show_shop')) {
    function should_show_shop($user_id) {
        try {
            $subscription = App\Models\Subscription::where('user_id', $user_id)->orderBy('id','DESC')->first();            
     
            if(!$subscription) {
                return true;
            }
       
            if(in_array($subscription->package_id, [11, 12])) {
                return false;
            }
            
             return true;
            
        } catch (\Exception $e) {
            \Log::error('should_show_shop error: ' . $e->getMessage());
            return true;
        }
    }
}



if (!function_exists('should_show_order_manager')) {
    function should_show_order_manager() {
        try {
            $user_id = auth()->id();
            if (!$user_id) {
                return true;
            }
            
            $subscription = App\Models\Subscription::where('user_id', $user_id)->orderBy('id','DESC')->first();            

            if($subscription && in_array($subscription->package_id, [11, 12])) {
                return false;
            }
    
            return true;
            
        } catch (\Exception $e) {
            \Log::error('should_show_order_manager error: ' . $e->getMessage());
            return true;
        }
    }
}


if (!function_exists('should_show_whatsapp')) {
    function should_show_whatsapp() {
        try {
            $user_id = auth()->id();
            if (!$user_id) {
                return true;
            }
            
            $subscription = App\Models\Subscription::where('user_id', $user_id)->orderBy('id','DESC')->first();            

            if($subscription && in_array($subscription->package_id, [11, 12, 13])) {
                return false;
            }
    
            return true;
            
        } catch (\Exception $e) {
            \Log::error('should_show_whatsapp error: ' . $e->getMessage());
            return true;
        }
    }
}

if (!function_exists('should_show_listing_distance')) {
    function should_show_listing_distance(): bool
    {
        return filter_var(config('services.geolocation.show_distance', true), FILTER_VALIDATE_BOOLEAN);
    }
}

if (!function_exists('listing_distance_km')) {
    function listing_distance_km($listing): ?float
    {
        if (!should_show_listing_distance()) {
            return null;
        }

        if (isset($listing->distance) && $listing->distance !== null) {
            return round((float) $listing->distance, 1);
        }

        $userCoords = \App\Services\GeolocationService::getUserCoordinatesFromSession();
        if (!$userCoords) {
            return null;
        }

        $distance = \App\Services\GeolocationService::calculateDistance(
            $userCoords['latitude'],
            $userCoords['longitude'],
            $listing->Latitude ?? null,
            $listing->Longitude ?? null
        );

        return $distance;
    }
}

if (!function_exists('listing_distance_text')) {
    function listing_distance_text($listing): ?string
    {
        $km = listing_distance_km($listing);

        if ($km === null) {
            return null;
        }

        if ($km < 1) {
            return round($km * 1000) . ' m away';
        }

        return $km . ' km away';
    }
}

if (!function_exists('sort_listings_by_distance')) {
    function sort_listings_by_distance($listings, ?int $limit = null)
    {
        if ($listings instanceof \Illuminate\Pagination\LengthAwarePaginator) {
            return $listings;
        }

        $collection = $listings instanceof \Illuminate\Support\Collection
            ? $listings
            : collect($listings);

        $userCoords = \App\Services\GeolocationService::getUserCoordinatesFromSession();

        if (!$userCoords) {
            $sorted = $collection->sortByDesc('created_at')->values();
            return $limit ? $sorted->take($limit) : $sorted;
        }

        return \App\Services\GeolocationService::sortListingsByDistance(
            $collection,
            $userCoords['latitude'],
            $userCoords['longitude'],
            $limit
        );
    }
}

/**
 * Unread chat messages for the logged-in user (received, not yet opened Messages tab).
 */
if (!function_exists('unread_message_count')) {
    function unread_message_count($userId = null): int
    {
        $userId = $userId ?: (function_exists('user') ? user('id') : null);
        if (!$userId) {
            return 0;
        }

        $codes = \App\Models\Message_thread::where('sender', $userId)
            ->orWhere('receiver', $userId)
            ->pluck('message_thread_code');

        if ($codes->isEmpty()) {
            return 0;
        }

        return (int) \App\Models\Message::whereIn('message_thread_code', $codes)
            ->where('sender', '!=', $userId)
            ->where('read_status', 0)
            ->count();
    }
}

/**
 * Logged-in user profile values for enquiry / appointment form autofill.
 */
if (!function_exists('auth_enquiry_defaults')) {
    function auth_enquiry_defaults(): array
    {
        $empty = [
            'name' => '',
            'email' => '',
            'phone' => '',
            'location' => '',
        ];

        if (!auth()->check()) {
            return $empty;
        }

        $user = auth()->user();
        $location = trim((string) ($user->addressline ?? ''));

        if ($location === '' && !empty($user->address)) {
            $address = is_string($user->address)
                ? json_decode($user->address)
                : $user->address;

            if (is_object($address) && !empty($address->city)) {
                $city = \App\Models\City::find($address->city);
                if ($city && !empty($city->name)) {
                    $location = $city->name;
                }
            }
        }

        $phone = trim((string) ($user->phone ?? ''));
        if ($phone === '') {
            $phone = trim((string) ($user->whatsapp ?? ''));
        }

        return [
            'name' => trim((string) ($user->name ?? '')),
            'email' => trim((string) ($user->email ?? '')),
            'phone' => $phone,
            'location' => $location,
        ];
    }
}

/**
 * Match a form-builder / appointment field label to a user profile value.
 * Returns empty string when not logged in or field is not user-related.
 */
if (!function_exists('auth_enquiry_prefill')) {
    function auth_enquiry_prefill(?string $label = '', ?string $fieldType = null, ?string $subtype = null, ?string $fieldName = null): string
    {
        $defaults = auth_enquiry_defaults();
        if (!auth()->check()) {
            return '';
        }

        $label = strtolower(trim((string) $label));
        $subtype = strtolower(trim((string) ($subtype ?? '')));
        $fieldName = strtolower(trim((string) ($fieldName ?? '')));
        $fieldType = strtolower(trim((string) ($fieldType ?? '')));

        // Never autofill free-form enquiry content
        $skip = ['service', 'remark', 'message', 'comment', 'note', 'requirement', 'best time', 'call time', 'date', 'time', 'adult', 'child', 'guest'];
        foreach ($skip as $word) {
            if ($label !== '' && str_contains($label, $word)) {
                return '';
            }
        }

        if ($subtype === 'email' || $fieldType === 'email' || str_contains($label, 'email') || str_contains($fieldName, 'email')) {
            return $defaults['email'];
        }

        if (
            str_contains($label, 'phone')
            || str_contains($label, 'mobile')
            || str_contains($label, 'whatsapp')
            || str_contains($label, 'contact no')
            || str_contains($label, 'contact number')
            || str_contains($fieldName, 'phone')
            || str_contains($fieldName, 'mobile')
        ) {
            return $defaults['phone'];
        }

        if (
            str_contains($label, 'location')
            || str_contains($label, 'address')
            || $label === 'city'
            || str_contains($label, 'your city')
            || str_contains($fieldName, 'location')
            || str_contains($fieldName, 'address')
        ) {
            return $defaults['location'];
        }

        if (
            $label === 'name'
            || str_contains($label, 'your name')
            || str_contains($label, 'full name')
            || str_contains($label, 'customer name')
            || ($fieldName === 'name')
        ) {
            return $defaults['name'];
        }

        // Generic "name" label without company/business
        if (str_contains($label, 'name') && !str_contains($label, 'company') && !str_contains($label, 'business') && !str_contains($label, 'listing')) {
            return $defaults['name'];
        }

        return '';
    }
}

if (!function_exists('deactivate_user_subscriptions')) {

    function deactivate_user_subscriptions($user_id){
        return DB::table('subscriptions')
            ->where('user_id', $user_id)
            ->where('status', 1)
            ->update([
                'status' => 0,
                'updated_at' => now(),
            ]);
    }
}


if (!function_exists('can_add_listing')) {

    function can_add_listing(){

        $user_id = Auth::id();

        // Current active subscription check
        $subscription = DB::table('subscriptions')
            ->where('user_id', $user_id)
            ->where('status', 1)
            ->where(function ($query) {
                $query->whereNull('expire_date')      // Free Package
                      ->orWhere('expire_date', '>', now()); // Paid Active Package
            })
            ->latest('id')
            ->first();

        if (!$subscription) {
            return [
                'status' => false,
                'message' => 'No active subscription found.'
            ];
        }

        $pricing = DB::table('pricings')->where('id', $subscription->package_id)->first();

        if (!$pricing) {
            return [
                'status' => false,
                'message' => 'Package details not found.'
            ];
        }

        $max_listings = $pricing->number_of_listings ?? 0;

        // Total listings count
        $current_listings =
            DB::table('custom_listings')->where('user_id', $user_id)->count() +
            DB::table('car_listings')->where('user_id', $user_id)->count() +
            DB::table('hotel_listings')->where('user_id', $user_id)->count() +
            DB::table('real_estate_listings')->where('user_id', $user_id)->count() +
            DB::table('restaurant_listings')->where('user_id', $user_id)->count();

        if ($current_listings >= $max_listings) {
            return [
                'status' => false,
                'message' => 'Your package listing limit has been reached. Please upgrade your package to add more listings.',
                'debug' => [
                    'current_listings' => $current_listings,
                    'max_listings' => $max_listings,
                    'package' => $pricing->name,
                ]
            ];
        }

        return [
            'status' => true,
            'remaining' => $max_listings - $current_listings,
            'package' => $pricing->name,
            'debug' => [
                'current_listings' => $current_listings,
                'max_listings' => $max_listings,
            ]
        ];
    }
}




if (!function_exists('can_create_new_listing')) {

    function can_create_new_listing(){

        $user_id = auth()->id();

        // Active package
        $subscription = DB::table('subscriptions')->where('user_id', $user_id)->where('status', 1)->latest('id')->first();

        if (!$subscription) {
            return [
                'status' => false,
                'message' => 'Please purchase a package first.'
            ];
        }

        // Total existing listings
        $currentListings =
            DB::table('custom_listings')->where('user_id',$user_id)->count()
            + DB::table('car_listings')->where('user_id',$user_id)->count()
            + DB::table('hotel_listings')->where('user_id',$user_id)->count()
            + DB::table('restaurant_listings')->where('user_id',$user_id)->count()
            + DB::table('beauty_listings')->where('user_id',$user_id)->count()
            + DB::table('real_estate_listings')->where('user_id',$user_id)->count();

        // FREE PACKAGE
        if($subscription->package_id == 11){

            if($currentListings >= 1){

                return [
                    'status'=>false,
                    'message'=>'Free package allows only one listing.'
                ];
            }

            return [
                'status'=>true
            ];
        }

        // Paid Packages
        if($currentListings >= 3){

            return [
                'status'=>false,
                'message'=>'Your package listing limit has been reached.'
            ];
        }

        return [
            'status'=>true
        ];
    }

}





