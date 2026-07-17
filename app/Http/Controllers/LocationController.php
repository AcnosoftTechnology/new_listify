<?php

namespace App\Http\Controllers;

use App\Models\BeautyListing;
use App\Models\CarListing;
use App\Models\City;
use App\Models\Country;
use App\Models\CustomListings;
use App\Models\CustomType;
use App\Models\HotelListing;
use App\Models\RealEstateListing;
use App\Models\RestaurantListing;
use App\Services\GeolocationService;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    /**
     * Get user's address from coordinates and reverse geocode it
     */
    public function getUserAddress(Request $request)
    {
        $request->validate([
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
        ]);

        $address = GeolocationService::getAddressFromCoordinates(
            $request->latitude,
            $request->longitude
        );

        return response()->json([
            'success' => true,
            'data' => $address,
        ]);
    }

    /**
     * Forward geocode address to coordinates
     */
    public function geocodeAddress(Request $request)
    {
        $request->validate([
            'address' => 'required|string|max:500',
            'city' => 'nullable',
            'country' => 'nullable',
        ]);

        $coordinates = GeolocationService::getCoordinatesFromAddress(
            $request->address,
            $request->city,
            $request->country
        );

        if (!$coordinates) {
            return response()->json([
                'success' => false,
                'message' => 'Could not geocode address',
            ], 422);
        }

        return response()->json([
            'success' => true,
            'data' => $coordinates,
        ]);
    }

    /**
     * Get nearby listings based on user coordinates and type
     */
    public function getNearbyListings(Request $request)
    {
        $request->validate([
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
            'type' => 'required|string',
            'radius' => 'nullable|numeric|min:1|max:500',
        ]);

        $radius = $request->radius ?? config('services.geolocation.radius_km', 50);
        $type = $request->type;

        $staticTypes = [
            'hotel' => HotelListing::class,
            'beauty' => BeautyListing::class,
            'restaurant' => RestaurantListing::class,
            'car' => CarListing::class,
            'real-estate' => RealEstateListing::class,
        ];

        if (isset($staticTypes[$type])) {
            $modelClass = $staticTypes[$type];
            $nearby = GeolocationService::getSortedListings(
                $modelClass,
                $request->latitude,
                $request->longitude,
                8
            );
        } else {
            $nearby = GeolocationService::getSortedListings(
                CustomListings::class,
                $request->latitude,
                $request->longitude,
                8,
                function ($query) use ($type) {
                    $query->where('type', $type);
                }
            );
        }

        return response()->json([
            'success' => true,
            'data' => $nearby->map(function ($listing) use ($type) {
                return GeolocationService::formatListingForApi($listing, $type);
            }),
        ]);
    }

    /**
     * Get sorted featured listings for homepage reorder
     */
    public function getSortedFeaturedListings(Request $request)
    {
        $request->validate([
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
        ]);

        $lat = $request->latitude;
        $lng = $request->longitude;
        $result = [];

        $staticTypes = [
            'hotel' => HotelListing::class,
            'restaurant' => RestaurantListing::class,
            'beauty' => BeautyListing::class,
            'car' => CarListing::class,
            'real-estate' => RealEstateListing::class,
        ];

        foreach ($staticTypes as $type => $modelClass) {
            $sorted = GeolocationService::getSortedListings($modelClass, $lat, $lng, 8);
            $result[$type] = $sorted->map(function ($listing) {
                return [
                    'id' => $listing->id,
                    'distance' => $listing->distance,
                ];
            })->values()->all();
        }

        $customTypes = CustomType::where('status', 1)->where('featured', '1')->get();
        foreach ($customTypes as $customType) {
            $sorted = GeolocationService::getSortedListings(
                CustomListings::class,
                $lat,
                $lng,
                8,
                function ($query) use ($customType) {
                    $query->where('type', $customType->slug);
                }
            );
            $result[$customType->slug] = $sorted->map(function ($listing) {
                return [
                    'id' => $listing->id,
                    'distance' => $listing->distance,
                ];
            })->values()->all();
        }

        return response()->json([
            'success' => true,
            'data' => $result,
        ]);
    }

    /**
     * Store user location in session
     */
    public function storeUserLocation(Request $request)
    {
        $request->validate([
            'latitude' => 'required|numeric|between:-90,90',
            'longitude' => 'required|numeric|between:-180,180',
        ]);

        session([
            'user_latitude' => $request->latitude,
            'user_longitude' => $request->longitude,
        ]);

        return response()->json(['success' => true]);
    }
}
