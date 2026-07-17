if (!function_exists('can_add_listing')) {
  
    function can_add_listing() {
      
        $user_id = Auth::id();
        
        // Current active subscription check karein
        $subscription = DB::table('subscriptions')
            ->where('user_id', $user_id)
            ->where('status', '1')
            ->where('expire_date', '>', now())
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

        // Individual tables se count लेकर total calculate करें
        $current_listings = 
            DB::table('custom_listings')->where('user_id', $user_id)->count() +
            DB::table('car_listings')->where('user_id', $user_id)->count() +
            DB::table('hotel_listings')->where('user_id', $user_id)->count() +
            DB::table('real_estate_listings')->where('user_id', $user_id)->count() +
            DB::table('restaurant_listings')->where('user_id', $user_id)->count();

        // Debugging ke liye data return karein
        if ($current_listings >= $max_listings) {
            return [
                'status' => false,
                'message' => 'Your package listing limit has been reached. Please upgrade your package to add more listings.',
                'debug' => [
                    'current_listings' => $current_listings,
                    'max_listings' => $max_listings,
                    'package' => $pricing->name
                ]
            ];
        }

        return [
            'status' => true,
            'remaining' => $max_listings - $current_listings,
            'package' => $pricing->name,
            'debug' => [
                'current_listings' => $current_listings,
                'max_listings' => $max_listings
            ]
        ];
    }
}













