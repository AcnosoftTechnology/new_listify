# Geolocation & Nearby Listings Feature - Implementation Guide

## Overview
This feature automatically detects user location and displays nearby listings on the homepage based on their geographic coordinates using the Haversine distance formula.

## Features Implemented

### 1. **Automatic User Location Detection**
- Browser geolocation API captures real-time user location
- Graceful fallback to default location if permission denied
- Location cached for 1 hour to reduce API calls

### 2. **Dynamic Location Display in Header**
- Header shows user's city and country (if available)
- Falls back to address from geolocation API response
- Loading animation while fetching location

### 3. **Nearby Listings on Homepage**
- Shows listings within configurable radius (default: 10 km)
- Distance badge on each listing card
- Sorted by distance from user
- Works for all listing types (Hotel, Beauty, Restaurant, Car, Real Estate)

### 4. **Distance Calculation**
- Uses Haversine formula for accurate distance calculation
- Server-side calculation ensures accuracy
- Supports up to 50 km radius

### 5. **Reverse Geocoding**
- Converts user coordinates to human-readable address
- Integrates with Google Maps Geocoding API
- Extracts city, country, and postal code

---

## Configuration

### Step 1: Add Google Maps API Key

1. Get a Google Maps API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Enable the following APIs:
   - Maps JavaScript API
   - Geocoding API
   - Distance Matrix API

3. Add to your `.env` file:
```env
GOOGLE_MAPS_API_KEY=YOUR_API_KEY_HERE
NEARBY_RADIUS_KM=10
ENABLE_GEOLOCATION=true
```

### Step 2: Database Setup

All necessary migrations have been created and applied. The following columns were added to listing tables:
- `Latitude` (decimal)
- `Longitude` (decimal)  
- `city` (string) - for locations without city column
- `country` (string) - for locations without country column
- `area` (string) - neighborhood/area
- `address` (string) - full address
- `postal_code` (string)

### Step 3: Add Coordinates to Listings

Listings need latitude and longitude values to appear in nearby searches. You can:

**Option A: Admin Panel**
- Edit listings and add coordinates
- Can use Google Maps to find coordinates

**Option B: Database Query**
```sql
UPDATE hotel_listings SET Latitude = 28.7041, Longitude = 77.1025 WHERE id = 1;
```

**Option C: API Integration** (if needed)
- Create a bulk update utility to geocode existing listings

---

## File Structure

```
listify/
├── app/
│   ├── Services/
│   │   └── GeolocationService.php          # Core geolocation logic
│   └── Http/Controllers/
│       └── LocationController.php           # API endpoints
├── database/migrations/
│   ├── 2026_06_06_130100_add_geolocation_to_hotel_listings.php
│   └── 2026_06_06_130101_add_geolocation_to_restaurant_listings.php
├── resources/
│   ├── js/
│   │   ├── geolocation.js                  # Browser geolocation handler
│   │   └── nearby-listings.js              # Nearby listings display
│   ├── css/
│   │   └── geolocation.css                 # Styling
│   └── views/
│       ├── layouts/frontend.blade.php      # Updated with geo scripts
│       └── frontend/index.blade.php        # Nearby section added
├── routes/
│   └── web.php                             # API routes added
└── .env                                    # Configuration
```

---

## API Endpoints

### 1. Get User Address
**POST** `/api/location/address`
```json
{
  "latitude": 28.7041,
  "longitude": 77.1025
}
```
**Response:**
```json
{
  "success": true,
  "data": {
    "address": "Delhi, India",
    "city": "Delhi",
    "country": "India",
    "postal_code": "110001"
  }
}
```

### 2. Get Nearby Listings
**POST** `/api/location/nearby`
```json
{
  "latitude": 28.7041,
  "longitude": 77.1025,
  "type": "hotel",
  "radius": 10
}
```
**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "title": "Hotel Name",
      "distance": "2.50 km",
      "latitude": 28.7100,
      "longitude": 77.1050,
      "city": "Delhi"
    }
  ]
}
```

### 3. Store User Location (Session)
**POST** `/api/location/store`
```json
{
  "latitude": 28.7041,
  "longitude": 77.1025
}
```

---

## How It Works

### User Flow:
1. **Page Load**: Geolocation script initializes
2. **Permission Request**: Browser asks user for location access
3. **Location Detection**: If allowed, coordinates are captured
4. **Address Lookup**: Coordinates sent to API for reverse geocoding
5. **Header Update**: User's city/location displayed in header
6. **Nearby Fetch**: Homepage requests nearby listings
7. **Display**: Nearby listings shown with distance badges

### Technical Flow:
```
geolocation.js
    ↓
navigator.geolocation.getCurrentPosition()
    ↓
Validate coordinates
    ↓
API: /location/address (Reverse Geocode)
    ↓
Update header with location
    ↓
Trigger 'geolocation-updated' event
    ↓
nearby-listings.js listens to event
    ↓
API: /location/nearby (Fetch listings per type)
    ↓
Render nearby listings with distance
```

---

## Privacy & Security

✅ **Privacy First:**
- Location is stored only in browser sessionStorage (not persisted)
- User can deny permission - defaults to static location
- No tracking cookies required
- GDPR compliant

✅ **Security:**
- Server-side distance calculation (API key protected)
- Coordinates validated before processing
- CSRF tokens on all requests
- API key restricted to server-side calls

---

## Troubleshooting

### Nearby Listings Not Showing
1. Check if `ENABLE_GEOLOCATION=true` in .env
2. Verify Google Maps API key is valid
3. Ensure listings have `Latitude` and `Longitude` values
4. Check browser console for JavaScript errors
5. Verify user allowed location permission

### Incorrect Distance
- Confirm coordinates are accurate
- Check that coordinates are in valid format (±180 for longitude, ±90 for latitude)
- Distance is calculated client-side before display verification

### Location Permission Denied
- Shows default location from settings
- User can manually change browser location settings
- Try in incognito mode or different browser

### API Errors
- Check `.env` file has valid `GOOGLE_MAPS_API_KEY`
- Verify Google Maps APIs are enabled in Cloud Console
- Check Laravel logs in `storage/logs/`

---

## Testing the Feature

### 1. Manual Testing
- Visit homepage from different locations
- Check header shows correct location
- Verify nearby listings appear with accurate distances
- Test browser permission deny/allow states

### 2. Simulate Different Locations
**Chrome DevTools:**
- Open DevTools → Sensors tab
- Select location or enter custom coordinates
- Refresh page and test

### 3. Database Testing
```php
// Check listings have coordinates
DB::table('hotel_listings')->whereNull('Latitude')->count();

// Manually add test coordinates
DB::table('hotel_listings')->find(1)->update([
    'Latitude' => 28.7041,
    'Longitude' => 77.1025,
    'city' => 'Delhi'
]);
```

---

## Future Enhancements

- [ ] User can toggle geolocation feature
- [ ] Filter by distance on listing pages
- [ ] Direction links to Google Maps
- [ ] Save favorite nearby locations
- [ ] Notifications for listings near user
- [ ] Admin analytics on user locations (aggregated)
- [ ] Nearby stores/restaurants integration

---

## Support & Maintenance

### Regular Checks:
- Monitor Google Maps API quota usage
- Update listing coordinates periodically
- Check for browser geolocation API deprecations
- Review privacy policy compliance

### Performance:
- Geolocation APIs are cached per session
- Nearby calculations use efficient Haversine formula
- Limit nearby listings to 8 per type by default

---

## Credits

Built with:
- Laravel Framework
- Browser Geolocation API
- Google Maps Geocoding API
- Haversine Distance Formula
- Modern JavaScript (ES6+)

