<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="csrf-token" content="{{ csrf_token() }}" />

{{ config(['app.name' => get_settings('system_title')]) }}

@php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Request;

if(isset($type) && isset($listing_id)){
       if($type == 'beauty'){
            $seo_field = App\Models\BeautyListing::where('id', $listing_id)->first();
        }elseif($type == 'car'){
            $seo_field = App\Models\CarListing::where('id', $listing_id)->first();
        }elseif($type == 'real-estate'){
            $seo_field = App\Models\RealEstateListing::where('id', $listing_id)->first();
        }elseif($type == 'hotel'){
            $seo_field = App\Models\HotelListing::where('id', $listing_id)->first();
        }elseif($type == 'restaurant'){
            $seo_field = App\Models\RestaurantListing::where('id', $listing_id)->first();
        }else{
            $seo_field = App\Models\CustomListings::where('id', $listing_id)->first();
        }

}else{

    $current_route = Route::currentRouteName();
    $seo_field = App\Models\SeoField::where('name_route', $current_route)->first();

    if(empty($seo_field)){
        $last_segment = Request::segment(count(Request::segments())); 
        $seo_field = App\Models\SeoField::where('route', $last_segment)->first();
    }

    if(!$seo_field){
        $seo_field = new App\Models\SeoField();
    }
}
@endphp

@if (!empty($seo_field['meta_title']))
<title>{{ $seo_field['meta_title'] }}</title>
@else
<title>@stack('title') | {{ config('app.name') }}</title>
@endif

@php
$keywords = '';
if (!empty($seo_field['meta_keywords'])) {

    $decoded = json_decode($seo_field['meta_keywords'], true);

    if (is_array($decoded)) {
        $keywords = implode(', ', array_column($decoded, 'value'));
    } else {
        $keywords = $seo_field['meta_keywords'];
    }
}
@endphp

<meta name="keywords" content="{{ $keywords  ?? '' }}">
<meta name="description" content="{{ $seo_field['meta_description'] ?? '' }}">
<meta name="robots" content="{{ $seo_field['meta_robot'] ?? '' }}">
<link rel="canonical" href="{{ $seo_field['canonical_url'] ?? '' }}" />
<link rel="custom" href="{{ $seo_field['custom_url'] ?? '' }}" />
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="{{$seo_field['meta_title'] ?? ''}}">

@if(isset($seo_field['json_ld']))
{!! removeScripts($seo_field['json_ld'] != strip_tags($seo_field['json_ld']) ? $seo_field['json_ld']:'') !!}
@endif

<meta property="og:title" content="{{ $seo_field['og_title'] ?? '' }}" />
<meta property="og:description" content="{{ $seo_field['og_description'] ?? '' }}" />

@if(isset($type) && isset($listing_id))
<meta property="og:image" content="{{ get_image('storage/og_image/'.$seo_field['og_image']) }}" />
@else
<meta property="og:image" content="{{ (file_exists(public_path('uploads/seo-og-images/' . ($seo_field->og_image ?? ''))) && is_file(public_path('uploads/seo-og-images/' . ($seo_field->og_image ?? '')))) ? asset('uploads/seo-og-images/' . $seo_field->og_image) : asset('image/placeholder.png') }}" />
@endif

@stack('meta')
