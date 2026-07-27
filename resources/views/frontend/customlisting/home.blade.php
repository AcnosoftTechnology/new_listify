@extends('layouts.frontend')
@push('title', get_phrase('Custom Listing Details'))
@push('meta')@endpush
@push('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/mapbox-gl.css') }}">
    <script src="{{ asset('assets/frontend/js/mapbox-gl.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/magnific-popup.css') }}">
    <script src="{{ asset('assets/frontend/js/jquery.magnific-popup.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/flatpickr.min.css') }}">
    <script src="{{ asset('assets/frontend/js/flatpickr.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/venobox.min.css') }}">
    <script src="{{ asset('assets/frontend/js/venobox.min.js') }}"></script>
@endpush

@section('frontend_layout')

<section class="ht-banner-section mb-60px" 
    style="background-image: url('{{ $page_data->banner_bg_image ? asset($page_data->banner_bg_image) : asset('assets/frontend/images/hotel/bg-card-banner1.webp') }}'); background-repeat: no-repeat;width: 100%;background-position: center; background-size: cover;">

    <div class="container">
        <div class="row">
            <div class="col-12">
                <p class="dm-uppercase-text-16px text-center">{{ $page_data->listing_type ?? '' }}</p>
                <h1 class="dm-title-60px text-capitalize fw-semibold text-white mb-30px text-center">
                    {{ $page_data->banner_title ?? 'Stay with us feel like home' }}
                </h1>
                <p class="in-subtitle-16px text-white text-center max-w-723px mx-auto mb-40px">
                    {{ $page_data->banner_description ?? 'Awesome site description here...' }}
                </p>
                
                <div class="mb-60px d-flex align-items-center gap-3 flex-wrap justify-content-center">

                    @if(!empty($page_data->slug))
                        <a href="{{ url('listing/' . $page_data->slug . '/grid') }}" class="btn ht-btn-primary">
                            Explore More
                        </a>
                    @endif

                    @if(!empty($page_data->banner_tab_link))
                        <a href="{{ $page_data->banner_tab_link }}" class="btn ht-btn-primary">
                            {{ $page_data->banner_tab_name ?? 'Learn More' }}
                        </a>
                    @endif

                </div>

            </div>
        </div>
    </div>
</section>


@php
    $topListings = $listings->where('is_popular', 'top');
@endphp

@if($topListings->count() > 0)
<section class="mb-100px">
    <div class="container">
        <div class="row mb-40px">
            <div class="col-12">
              <div class="d-flex align-items-center justify-content-between flex-wrap column-gap-4 row-gap-2 mb-30px">
                 <h2 class="dm-title-36px fw-semibold capitalize">Top {{ $slug }} Listings</h2>
                 <a href="https://www.listify.asia/listing/{{ $page_data->listing_type ?? '' }}/grid" class="ht-icontext-link d-flex align-items-center gap-1">
                    <span>See all</span>
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.09171 4.40833C8.01361 4.4858 7.95161 4.57796 7.9093 4.67951C7.867 4.78106 7.84521 4.88998 7.84521 4.99999C7.84521 5.11 7.867 5.21893 7.9093 5.32047C7.95161 5.42202 8.01361 5.51419 8.09171 5.59166L11.9084 9.40833C11.9865 9.48579 12.0485 9.57796 12.0908 9.67951C12.1331 9.78106 12.1549 9.88998 12.1549 9.99999C12.1549 10.11 12.1331 10.2189 12.0908 10.3205C12.0485 10.422 11.9865 10.5142 11.9084 10.5917L8.09171 14.4083C8.01361 14.4858 7.95161 14.578 7.9093 14.6795C7.867 14.7811 7.84521 14.89 7.84521 15C7.84521 15.11 7.867 15.2189 7.9093 15.3205C7.95161 15.422 8.01361 15.5142 8.09171 15.5917C8.24785 15.7469 8.45906 15.834 8.67921 15.834C8.89937 15.834 9.11058 15.7469 9.26671 15.5917L13.0917 11.7667C13.5599 11.2979 13.8228 10.6625 13.8228 9.99999C13.8228 9.33749 13.5599 8.70208 13.0917 8.23333L9.26671 4.40833C9.11058 4.25312 8.89937 4.166 8.67921 4.166C8.45906 4.166 8.24785 4.25312 8.09171 4.40833Z" fill="#060F19"></path>
                    </svg>
                 </a>
              </div>                
            </div>
        </div>
        <div class="row row-28">
            @foreach (sort_listings_by_distance($topListings) as $listing)
                <!-- Single Card -->
                <div class="col-sm-6 {{ get_frontend_settings('map_position') == 'right' ? 'col-sm-6' : 'col-xl-3' }} map-card">
                    <div class="single-grid-card">
                        <!-- Banner Slider -->
                        <div class="grid-slider-area">
                          @php
    $images = json_decode($listing->image, true) ?? [];

    $image = !empty($images[0]) ? $images[0] : null;

    $claimStatus = App\Models\ClaimedListing::where('listing_id', $listing->id)
                    ->where('listing_type', $slug)
                    ->first();
@endphp
                            <a class="w-100 h-100"
   href="{{ route('listing.details',['type'=>$slug, 'id'=>$listing->id, 'slug'=>slugify($listing->title)]) }}">

    <img class="card-item-image"
         src="{{ !empty($image) 
                ? get_all_image('listing-images/' . $image) 
                : asset('assets/frontend/images/default-image.webp') }}"
         alt="Listing Image">

</a>
                            <p class="card-light-text theme-light capitalize">{{ $listing->is_popular }}</p>
                            @php
                                $is_in_wishlist = check_wishlist_status($listing->id, $listing->type);
                            @endphp
                            <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-title="{{ $is_in_wishlist ? get_phrase('Remove from Wishlist') : get_phrase('Add to Wishlist') }}" onclick="updateWishlist(this, '{{ $listing->id }}')" class="grid-list-bookmark white-bookmark {{ $is_in_wishlist ? 'active' : '' }}">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M13.4361 3C12.7326 3.01162 12.0445 3.22023 11.4411 3.60475C10.8378 3.98927 10.3407 4.53609 10 5.18999C9.65929 4.53609 9.16217 3.98927 8.55886 3.60475C7.95554 3.22023 7.26738 3.01162 6.56389 3C5.44243 3.05176 4.38583 3.57288 3.62494 4.44953C2.86404 5.32617 2.4607 6.48707 2.50302 7.67861C2.50302 10.6961 5.49307 13.9917 8.00081 16.2262C8.56072 16.726 9.26864 17 10 17C10.7314 17 11.4393 16.726 11.9992 16.2262C14.5069 13.9917 17.497 10.6961 17.497 7.67861C17.5393 6.48707 17.136 5.32617 16.3751 4.44953C15.6142 3.57288 14.5576 3.05176 13.4361 3Z" fill="#6C1CFF" />
                                </svg>
                            </a>
                        </div>
                        <div class="hotel-grid-details position-relative">
                            <a href="{{ route('listing.details', ['type' => $slug, 'id' => $listing->id, 'slug' => slugify($listing->title)]) }}" class="title">
                                @if(isset($claimStatus) && $claimStatus->status == 1) 
                                <span data-bs-toggle="tooltip" 
                                data-bs-title=" {{ get_phrase('This listing is verified') }}">
                                <svg fill="none" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><linearGradient id="paint0_linear_16_1334" gradientUnits="userSpaceOnUse" x1="12" x2="12" y1="-1.2" y2="25.2"><stop offset="0" stop-color="#ce9ffc"/><stop offset=".979167" stop-color="#7367f0"/></linearGradient><path d="m3.783 2.826 8.217-1.826 8.217 1.826c.2221.04936.4207.17297.563.3504.1424.17744.22.39812.22.6256v9.987c-.0001.9877-.244 1.9602-.7101 2.831s-1.14 1.6131-1.9619 2.161l-6.328 4.219-6.328-4.219c-.82173-.5478-1.49554-1.2899-1.96165-2.1605-.46611-.8707-.71011-1.8429-.71035-2.8305v-9.988c.00004-.22748.07764-.44816.21999-.6256.14235-.17743.34095-.30104.56301-.3504zm8.217 10.674 2.939 1.545-.561-3.272 2.377-2.318-3.286-.478-1.469-2.977-1.47 2.977-3.285.478 2.377 2.318-.56 3.272z" fill="url(#paint0_linear_16_1334)"/></svg>
                                </span>
                                @endif
                                {{ $listing->title }} </a>

                            <div class="hotelgrid-location-rating d-flex align-items-center justify-content-between flex-wrap">
                                <div class="location d-flex">
                                    <img src="{{ asset('assets/frontend/images/icons/location-gray-16.svg') }}" alt="">
                                    @php
    $city = App\Models\City::find($listing->city);
    $country = App\Models\Country::find($listing->country);

    $city_name = $city ? $city->name : '';
    $country_name = $country ? $country->name : '';
@endphp
                                    <p class="name"> {{ $city_name . ', ' . $country_name }} </p>
                                </div>
                                @php
                                    $reviews_count = App\Models\Review::where('listing_id', $listing->id)->where('user_id', '!=', $listing->user_id)->where('type', $slug)->where('reply_id', null)->count();
                                    $total_ratings = App\Models\Review::where('listing_id', $listing->id)->where('user_id', '!=', $listing->user_id)->where('type', $slug)->where('reply_id', null)->sum('rating');
                                    $average_rating = $reviews_count > 0 ? $total_ratings / $reviews_count : 0;
                                @endphp
                                <div class="ratings d-flex align-items-center">
                                    <p class="rating">{{ number_format($average_rating, 1) }}</p>
                                    <img src="{{ asset('assets/frontend/images/icons/star-yellow-20.svg') }}" alt="">
                                    <p class="reviews">({{ $reviews_count }})</p>
                                </div>
                            </div>
                            <ul class="hotelgrid-list-items d-flex align-items-center flex-wrap">
                                @php
                                    if (isset($listing->feature) && is_array(json_decode($listing->feature))) {
                                        $features = json_decode($listing->feature);
                                        foreach ($features as $key => $item) {
                                            $feature = App\Models\Amenities::where('id', $item)->first();
                                            if ($key < 2) {
                                                echo '<li>' . removeScripts($feature->name) . '</li>';
                                            }
                                        }
                                        $more_amenities = count(json_decode($listing->feature));
                                        if ($more_amenities > 4) {
                                            echo "<li class='more'>+" . ($more_amenities - 4) . ' ' . get_phrase('More') . '</li>';
                                        }
                                    }
                                @endphp
                            </ul>
                            <div class="hotelgrid-see-price d-flex align-items-center justify-content-between">
                                <a href="{{ route('listing.details', ['type' => $slug, 'id' => $listing->id, 'slug' => slugify($listing->title)]) }}" class="see-details-btn1 stretched-link">{{ get_phrase('See Details') }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
@endif


@php
    $popularListings = $listings->where('is_popular', 'popular');
@endphp

@if($popularListings->count() > 0)
<section class="mb-100px">
    <div class="container">
        <div class="row mb-40px">
            <div class="col-12">
              <div class="d-flex align-items-center justify-content-between flex-wrap column-gap-4 row-gap-2 mb-30px">
                 <h2 class="dm-title-36px fw-semibold capitalize">Popular {{ $slug }} Listings</h2>
                 <a href="https://www.listify.asia/listing/{{ $page_data->listing_type ?? '' }}/grid" class="ht-icontext-link d-flex align-items-center gap-1">
                    <span>See all</span>
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.09171 4.40833C8.01361 4.4858 7.95161 4.57796 7.9093 4.67951C7.867 4.78106 7.84521 4.88998 7.84521 4.99999C7.84521 5.11 7.867 5.21893 7.9093 5.32047C7.95161 5.42202 8.01361 5.51419 8.09171 5.59166L11.9084 9.40833C11.9865 9.48579 12.0485 9.57796 12.0908 9.67951C12.1331 9.78106 12.1549 9.88998 12.1549 9.99999C12.1549 10.11 12.1331 10.2189 12.0908 10.3205C12.0485 10.422 11.9865 10.5142 11.9084 10.5917L8.09171 14.4083C8.01361 14.4858 7.95161 14.578 7.9093 14.6795C7.867 14.7811 7.84521 14.89 7.84521 15C7.84521 15.11 7.867 15.2189 7.9093 15.3205C7.95161 15.422 8.01361 15.5142 8.09171 15.5917C8.24785 15.7469 8.45906 15.834 8.67921 15.834C8.89937 15.834 9.11058 15.7469 9.26671 15.5917L13.0917 11.7667C13.5599 11.2979 13.8228 10.6625 13.8228 9.99999C13.8228 9.33749 13.5599 8.70208 13.0917 8.23333L9.26671 4.40833C9.11058 4.25312 8.89937 4.166 8.67921 4.166C8.45906 4.166 8.24785 4.25312 8.09171 4.40833Z" fill="#060F19"></path>
                    </svg>
                 </a>
              </div>               
            </div>
        </div>
        <div class="row row-28">
            @foreach (sort_listings_by_distance($popularListings) as $listing)
                <!-- Single Card -->
                <div class="col-sm-6 {{ get_frontend_settings('map_position') == 'right' ? 'col-sm-6' : 'col-xl-3' }} map-card">
                    <div class="single-grid-card">
                        <!-- Banner Slider -->
                        <div class="grid-slider-area">
                            @php
                                $images = json_decode($listing->image);
                                $image = isset($images[0]) ? $images[0] : null;

                                $claimStatus = App\Models\ClaimedListing::where('listing_id', $listing->id)->where('listing_type', $slug)->first(); 
                            @endphp
                            <a class="w-100 h-100" href="{{route('listing.details',['type'=>$slug, 'id'=>$listing->id, 'slug'=>slugify($listing->title)])}}">
                                <img class="card-item-image" src="{{ get_all_image('listing-images/' . $image) }}">
                            </a>
                            <p class="card-light-text theme-light capitalize">{{ $listing->is_popular }}</p>
                            @php
                                $is_in_wishlist = check_wishlist_status($listing->id, $listing->type);
                            @endphp
                            <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-title="{{ $is_in_wishlist ? get_phrase('Remove from Wishlist') : get_phrase('Add to Wishlist') }}" onclick="updateWishlist(this, '{{ $listing->id }}')" class="grid-list-bookmark white-bookmark {{ $is_in_wishlist ? 'active' : '' }}">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M13.4361 3C12.7326 3.01162 12.0445 3.22023 11.4411 3.60475C10.8378 3.98927 10.3407 4.53609 10 5.18999C9.65929 4.53609 9.16217 3.98927 8.55886 3.60475C7.95554 3.22023 7.26738 3.01162 6.56389 3C5.44243 3.05176 4.38583 3.57288 3.62494 4.44953C2.86404 5.32617 2.4607 6.48707 2.50302 7.67861C2.50302 10.6961 5.49307 13.9917 8.00081 16.2262C8.56072 16.726 9.26864 17 10 17C10.7314 17 11.4393 16.726 11.9992 16.2262C14.5069 13.9917 17.497 10.6961 17.497 7.67861C17.5393 6.48707 17.136 5.32617 16.3751 4.44953C15.6142 3.57288 14.5576 3.05176 13.4361 3Z" fill="#6C1CFF" />
                                </svg>
                            </a>
                        </div>
                        <div class="hotel-grid-details position-relative">
                            <a href="{{ route('listing.details', ['type' => $slug, 'id' => $listing->id, 'slug' => slugify($listing->title)]) }}" class="title">
                                @if(isset($claimStatus) && $claimStatus->status == 1) 
                                <span data-bs-toggle="tooltip" 
                                data-bs-title=" {{ get_phrase('This listing is verified') }}">
                                <svg fill="none" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><linearGradient id="paint0_linear_16_1334" gradientUnits="userSpaceOnUse" x1="12" x2="12" y1="-1.2" y2="25.2"><stop offset="0" stop-color="#ce9ffc"/><stop offset=".979167" stop-color="#7367f0"/></linearGradient><path d="m3.783 2.826 8.217-1.826 8.217 1.826c.2221.04936.4207.17297.563.3504.1424.17744.22.39812.22.6256v9.987c-.0001.9877-.244 1.9602-.7101 2.831s-1.14 1.6131-1.9619 2.161l-6.328 4.219-6.328-4.219c-.82173-.5478-1.49554-1.2899-1.96165-2.1605-.46611-.8707-.71011-1.8429-.71035-2.8305v-9.988c.00004-.22748.07764-.44816.21999-.6256.14235-.17743.34095-.30104.56301-.3504zm8.217 10.674 2.939 1.545-.561-3.272 2.377-2.318-3.286-.478-1.469-2.977-1.47 2.977-3.285.478 2.377 2.318-.56 3.272z" fill="url(#paint0_linear_16_1334)"/></svg>
                                </span>
                                @endif
                                {{ $listing->title }} </a>

                            <div class="hotelgrid-location-rating d-flex align-items-center justify-content-between flex-wrap">
                                <div class="location d-flex">
                                    <img src="{{ asset('assets/frontend/images/icons/location-gray-16.svg') }}" alt="">
                                    @php
                                        $city_name = App\Models\City::where('id', $listing->city)->first()->name;
                                        $country_name = App\Models\Country::where('id', $listing->country)->first()->name;
                                    @endphp
                                    <p class="name"> {{ $city_name . ', ' . $country_name }} </p>
                                </div>
                                @php
                                    $reviews_count = App\Models\Review::where('listing_id', $listing->id)->where('user_id', '!=', $listing->user_id)->where('type', $slug)->where('reply_id', null)->count();
                                    $total_ratings = App\Models\Review::where('listing_id', $listing->id)->where('user_id', '!=', $listing->user_id)->where('type', $slug)->where('reply_id', null)->sum('rating');
                                    $average_rating = $reviews_count > 0 ? $total_ratings / $reviews_count : 0;
                                @endphp
                                <div class="ratings d-flex align-items-center">
                                    <p class="rating">{{ number_format($average_rating, 1) }}</p>
                                    <img src="{{ asset('assets/frontend/images/icons/star-yellow-20.svg') }}" alt="">
                                    <p class="reviews">({{ $reviews_count }})</p>
                                </div>
                            </div>
                            <ul class="hotelgrid-list-items d-flex align-items-center flex-wrap">
                                @php
                                    if (isset($listing->feature) && is_array(json_decode($listing->feature))) {
                                        $features = json_decode($listing->feature);
                                        foreach ($features as $key => $item) {
                                            $feature = App\Models\Amenities::where('id', $item)->first();
                                            if ($key < 2) {
                                                echo '<li>' . removeScripts($feature->name) . '</li>';
                                            }
                                        }
                                        $more_amenities = count(json_decode($listing->feature));
                                        if ($more_amenities > 4) {
                                            echo "<li class='more'>+" . ($more_amenities - 4) . ' ' . get_phrase('More') . '</li>';
                                        }
                                    }
                                @endphp
                            </ul>
                            <div class="hotelgrid-see-price d-flex align-items-center justify-content-between">
                                <a href="{{ route('listing.details', ['type' => $slug, 'id' => $listing->id, 'slug' => slugify($listing->title)]) }}" class="see-details-btn1 stretched-link">{{ get_phrase('See Details') }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
@endif




<section>
    <div class="container">
        <div class="row justify-content-center mb-100px">
            <div class="col-xl-10">
                <div class="bg-img-card2" 
                     style="background-image: url('{{ asset($page_data->cta_bg_image ?? "public/uploads/homepage/hotel/1733382195_book-room-banner.webp") }}');background-repeat: no-repeat;width: 100%;background-position: center;background-size: cover;">
                    
                    <h1 class="dm-title-36px mb-26px text-white">
                        {{ $page_data->cta_bg_title ?? 'Stay with us feel like home' }}
                    </h1>
                    
                    <p style="color:#fff; font-size:16px; margin-bottom:20px; font-weight:500;">
                        {{ $page_data->cta_bg_description ?? 'Awesome site description here...' }}
                    </p>
                    
                    <div class="d-flex align-items-center gap-14px flex-wrap">
                        <a href="{{ $page_data->cta_tab_link ?? '#' }}" class="btn ht-btn-white">
                            {{ $page_data->cta_tab_name ?? 'Book Now' }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


@endsection

@push('js')

    @if (Auth::check())
        <script>
            "use strict";

            function updateWishlist(button, listingId) {
                const bookmarkButton = $(button);
                const isActive = bookmarkButton.hasClass('active');
                bookmarkButton.toggleClass('active');
                const newTooltipText = isActive ? 'Add to Wishlist' : 'Remove from Wishlist';
                bookmarkButton.attr('data-bs-title', newTooltipText);

                const tooltipInstance = bootstrap.Tooltip.getInstance(button);
                if (tooltipInstance) tooltipInstance.dispose();
                new bootstrap.Tooltip(button);

                $.ajax({
                    url: '{{ route('wishlist.update') }}',
                    method: 'POST',
                    data: {
                        listing_id: listingId,
                        type: '{{ $slug }}',
                        user_id: {{ auth()->check() ? auth()->id() : 'null' }},
                        _token: '{{ csrf_token() }}',
                    },
                    success: function(response) {
                        if (response.status === 'success') {
                            success(response.message);
                        } else if (response.status === 'error') {
                            bookmarkButton.toggleClass('active');
                            const revertTooltipText = isActive ? 'Remove from Wishlist' : 'Add to Wishlist';
                            bookmarkButton.attr('data-bs-title', revertTooltipText);
                            const revertTooltipInstance = bootstrap.Tooltip.getInstance(button);
                            if (revertTooltipInstance) revertTooltipInstance.dispose();
                            new bootstrap.Tooltip(button);
                        }
                    },
                    error: function(xhr) {
                        bookmarkButton.toggleClass('active');
                        const revertTooltipText = isActive ? 'Remove from Wishlist' : 'Add to Wishlist';
                        bookmarkButton.attr('data-bs-title', revertTooltipText);
                        const revertTooltipInstance = bootstrap.Tooltip.getInstance(button);
                        if (revertTooltipInstance) revertTooltipInstance.dispose();
                        new bootstrap.Tooltip(button);
                    },
                });
            }
        </script>
    @else
        <script>
            "use strict";

            function updateWishlist(listing_id) {
                warning("Please login first!");
            }
        </script>
    @endif
@endpush
