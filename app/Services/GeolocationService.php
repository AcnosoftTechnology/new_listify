<?php

namespace App\Services;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Http;

class GeolocationService
{
    /**
     * Normalize coordinate value (handles formatted strings like "28.710428 / N 28°...")
     */
    public static function normalizeCoordinate($value): ?float
    {
        if ($value === null || $value === '') {
            return null;
        }

        if (is_numeric($value)) {
            $float = (float) $value;
            return ($float >= -180 && $float <= 180) ? $float : null;
        }

        if (preg_match('/^-?\d+\.?\d*/', (string) $value, $matches)) {
            $float = (float) $matches[0];
            return ($float >= -180 && $float <= 180) ? $float : null;
        }

        return null;
    }

    /**
     * Calculate distance between two coordinates using Haversine formula (in km)
     */
    public static function calculateDistance($lat1, $lon1, $lat2, $lon2): ?float
    {
        $lat1 = self::normalizeCoordinate($lat1);
        $lon1 = self::normalizeCoordinate($lon1);
        $lat2 = self::normalizeCoordinate($lat2);
        $lon2 = self::normalizeCoordinate($lon2);

        if ($lat1 === null || $lon1 === null || $lat2 === null || $lon2 === null) {
            return null;
        }

        $earthRadius = 6371;
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);
        $a = sin($dLat / 2) * sin($dLat / 2) +
             cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
             sin($dLon / 2) * sin($dLon / 2);
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        return round($earthRadius * $c, 2);
    }

    /**
     * Get address from coordinates using Google Maps API
     */
    public static function getAddressFromCoordinates($latitude, $longitude): ?array
    {
        try {
            $apiKey = config('services.google.maps_api_key');
            if (!$apiKey) {
                return null;
            }

            $response = Http::get('https://maps.googleapis.com/maps/api/geocode/json', [
                'latlng' => "{$latitude},{$longitude}",
                'key' => $apiKey,
                'language' => 'en',
            ]);

            if ($response->successful() && !empty($response['results'])) {
                $result = $response['results'][0];
                return [
                    'address' => $result['formatted_address'] ?? '',
                    'city' => self::getAddressComponent($result, 'locality')
                        ?: self::getAddressComponent($result, 'administrative_area_level_2'),
                    'country' => self::getAddressComponent($result, 'country'),
                    'postal_code' => self::getAddressComponent($result, 'postal_code'),
                ];
            }
        } catch (\Exception $e) {
            \Log::error('Geolocation Error: ' . $e->getMessage());
        }

        return null;
    }

    /**
     * Get coordinates from address using Google Geocoding API
     */
    public static function getCoordinatesFromAddress(
        string $address,
        $city = null,
        $country = null
    ): ?array {
        try {
            $apiKey = config('services.google.maps_api_key');
            if (!$apiKey || trim($address) === '') {
                return null;
            }

            $parts = array_filter([
                trim($address),
                is_numeric($city) ? null : $city,
                is_numeric($country) ? null : $country,
            ]);

            $query = implode(', ', $parts);

            if (is_numeric($city)) {
                $cityModel = \App\Models\City::find($city);
                if ($cityModel) {
                    $query = trim($address) . ', ' . $cityModel->name;
                }
            }

            if (is_numeric($country)) {
                $countryModel = \App\Models\Country::find($country);
                if ($countryModel) {
                    $query .= ', ' . $countryModel->name;
                }
            }

            $response = Http::get('https://maps.googleapis.com/maps/api/geocode/json', [
                'address' => $query,
                'key' => $apiKey,
            ]);

            if ($response->successful() && !empty($response['results'])) {
                $location = $response['results'][0]['geometry']['location'] ?? null;
                if ($location) {
                    return [
                        'latitude' => $location['lat'],
                        'longitude' => $location['lng'],
                        'formatted_address' => $response['results'][0]['formatted_address'] ?? $query,
                    ];
                }
            }
        } catch (\Exception $e) {
            \Log::error('Forward Geocoding Error: ' . $e->getMessage());
        }

        return null;
    }

    /**
     * Resolve listing coordinates from request or auto-geocode address fields
     */
    public static function resolveListingCoordinates(
        ?string $latitude,
        ?string $longitude,
        ?string $address,
        $city = null,
        $country = null
    ): array {
        $lat = self::normalizeCoordinate($latitude);
        $lng = self::normalizeCoordinate($longitude);

        if ($lat !== null && $lng !== null) {
            return [
                'Latitude' => (string) $lat,
                'Longitude' => (string) $lng,
            ];
        }

        if ($address) {
            $geocoded = self::getCoordinatesFromAddress($address, $city, $country);
            if ($geocoded) {
                return [
                    'Latitude' => (string) $geocoded['latitude'],
                    'Longitude' => (string) $geocoded['longitude'],
                ];
            }
        }

        return [
            'Latitude' => $latitude ? sanitize($latitude) : '',
            'Longitude' => $longitude ? sanitize($longitude) : '',
        ];
    }

    /**
     * Extract specific address component from geocoding result
     */
    private static function getAddressComponent($result, $type): string
    {
        foreach ($result['address_components'] ?? [] as $component) {
            if (in_array($type, $component['types'] ?? [])) {
                return $component['long_name'] ?? '';
            }
        }
        return '';
    }

    /**
     * Validate if coordinates are within reasonable bounds
     */
    public static function validateCoordinates($latitude, $longitude): bool
    {
        $lat = self::normalizeCoordinate($latitude);
        $lng = self::normalizeCoordinate($longitude);

        return $lat !== null && $lng !== null;
    }

    /**
     * Attach distance to listing and sort nearest first; listings without coords go last
     */
    public static function sortListingsByDistance(
        Collection $listings,
        $userLat,
        $userLng,
        ?int $limit = null
    ): Collection {
        if (!self::validateCoordinates($userLat, $userLng)) {
            return $limit ? $listings->take($limit) : $listings;
        }

        $sorted = $listings->map(function ($listing) use ($userLat, $userLng) {
            $distance = self::calculateDistance(
                $userLat,
                $userLng,
                $listing->Latitude ?? null,
                $listing->Longitude ?? null
            );
            $listing->distance = $distance;
            return $listing;
        })->sortBy(function ($listing) {
            return $listing->distance === null ? PHP_FLOAT_MAX : $listing->distance;
        })->values();

        return $limit ? $sorted->take($limit) : $sorted;
    }

    /**
     * Get nearby listings for a given model and coordinates
     */
    public static function getNearbyListings(
        $modelClass,
        $latitude,
        $longitude,
        $radiusKm = 10,
        $limit = 8,
        ?callable $queryModifier = null
    ): Collection {
        if (!self::validateCoordinates($latitude, $longitude)) {
            return collect([]);
        }

        $query = $modelClass::where('visibility', 'visible')
            ->whereNotNull('Latitude')
            ->whereNotNull('Longitude');

        if ($queryModifier) {
            $queryModifier($query);
        }

        $listings = $query->get();

        $nearby = $listings->filter(function ($listing) use ($latitude, $longitude, $radiusKm) {
            $distance = self::calculateDistance(
                $latitude,
                $longitude,
                $listing->Latitude,
                $listing->Longitude
            );
            return $distance !== null && $distance <= $radiusKm;
        })->map(function ($listing) use ($latitude, $longitude) {
            $listing->distance = self::calculateDistance(
                $latitude,
                $longitude,
                $listing->Latitude,
                $listing->Longitude
            );
            return $listing;
        })->sortBy('distance')
          ->take($limit);

        return $nearby;
    }

    /**
     * Get sorted listings (all visible, nearest first regardless of radius)
     */
    public static function getSortedListings(
        $modelClass,
        $latitude,
        $longitude,
        $limit = 8,
        ?callable $queryModifier = null
    ): Collection {
        if (!self::validateCoordinates($latitude, $longitude)) {
            $query = $modelClass::where('visibility', 'visible');
            if ($queryModifier) {
                $queryModifier($query);
            }
            return $query->orderBy('created_at', 'desc')->take($limit)->get();
        }

        $query = $modelClass::where('visibility', 'visible');
        if ($queryModifier) {
            $queryModifier($query);
        }

        return self::sortListingsByDistance($query->get(), $latitude, $longitude, $limit);
    }

    /**
     * Get user coordinates from session
     */
    public static function getUserCoordinatesFromSession(): ?array
    {
        $lat = session('user_latitude');
        $lng = session('user_longitude');

        if (self::validateCoordinates($lat, $lng)) {
            return [
                'latitude' => self::normalizeCoordinate($lat),
                'longitude' => self::normalizeCoordinate($lng),
            ];
        }

        return null;
    }

    /**
     * Format listing for API response
     */
    public static function formatListingForApi($listing, string $type): array
    {
        $images = json_decode($listing->image ?? '[]') ?? [];
        $image = isset($images[0]) ? $images[0] : null;
        $imageUrl = $image
            ? asset('uploads/listing-images/' . $image)
            : asset('assets/images/default.png');

        $cityName = '';
        if (!empty($listing->city) && is_numeric($listing->city)) {
            $city = \App\Models\City::find($listing->city);
            $cityName = $city->name ?? '';
        } elseif (!empty($listing->city)) {
            $cityName = $listing->city;
        }

        return [
            'id' => $listing->id,
            'title' => $listing->title,
            'type' => $type,
            'distance' => isset($listing->distance) && $listing->distance !== null
                ? round($listing->distance, 2) . ' km'
                : null,
            'distance_km' => $listing->distance ?? null,
            'latitude' => $listing->Latitude,
            'longitude' => $listing->Longitude,
            'city' => $cityName,
            'image' => $imageUrl,
            'price' => $listing->price ?? null,
            'is_popular' => $listing->is_popular ?? '',
            'slug' => slugify($listing->title),
        ];
    }
}
