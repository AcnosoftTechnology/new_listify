@extends('layouts.frontend')
@push('title', get_phrase('User Profile'))
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

  <style>
    .profile-card {
      background-color: #fff;
      border-radius: .5rem;
      padding: 20px;
      text-align: center;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .profile-card img {
      width: 100%;
      height: 280px;
      object-fit: contain;
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
    }
    .p_card{
      border-bottom: 2px solid #eee;
    }
    .p_card_last{
      border-bottom:inherit;
    }
    .p_title{
      color:#000;
      font-weight:600;
    }
    .p_pera{
      font-size: 16px;
      font-weight: 500;
    }
    .profile-buttons .btn {
      margin: 5px;
    }
    .info-card {
      background-color: #fff;
      border-radius: .5rem;
      padding: 25px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .info-card .row + .row {
      margin-top: 10px;
    }
  </style>

<div class="container my-5">
  <div class="row">
    <!-- Left Profile Card -->
    <div class="col-md-4 my-2">
      <div class="profile-card">        
        <img src="{{ $user->image ? 'https://www.listify.asia/public/uploads/users/'.$user->image : 'https://www.listify.asia/public/image/user.jpg' }}" alt="User Avatar">
      </div>
    </div>

    <!-- Right Info Card -->
    <div class="col-md-8 my-2">
      <div class="info-card">
        
      @if(!empty($user->name))
        <div class="row p_card pb-2">
          <div class="col-sm-2 p_title">Full Name</div>
          <div class="col-sm-10 p_pera">{{ $user->name }}</div>
        </div>
      @endif

      @if(!empty($user->email))
        <div class="row p_card pb-2">
          <div class="col-sm-2 p_title">Email</div>
          <div class="col-sm-10 p_pera">{{ $user->email }}</div>
        </div>
      @endif
        
      @if(!empty($user->phone))
        <div class="row p_card pb-2">
          <div class="col-sm-2 p_title">Phone</div>
          <div class="col-sm-10 p_pera">{{ $user->phone }}</div>
        </div>
      @endif
        
      @if(!empty($user->gender))
        <div class="row p_card pb-2">
          <div class="col-sm-2 p_title">Gender</div>
          <div class="col-sm-10 p_pera">{{ $user->gender }}</div>
        </div>
      @endif
        
      @if(!empty($user->addressline))
        <div class="row p_card pb-2">
          <div class="col-sm-2 p_title">Address</div>
          <div class="col-sm-10 p_pera">{{ $user->addressline }}</div>
        </div>
      @endif
        
      @if(!empty($user->bio))
        <div class="row p_card p_card_last pb-2">
          <div class="col-sm-2 p_title">Bio</div>
          <div class="col-sm-10 p_pera">{{ $user->bio }}</div>
        </div>
      @endif
       
      </div>
    </div>
  </div>
</div>


<div class="container my-5">
  <div class="row mb-30px">
    <div class="col-12">
      <div class="column-gap-4 row-gap-2 text-center mb-30px">
        <h2 class="dm-title-36px fw-semibold capitalize">Our All Listings</h2>                 
       </div>                
     </div>
   </div> 
  
  <div class="row row-28">
    @php
        $topListings = collect([]);
        foreach($allListings as $tableListings) {
            $topListings = $topListings->merge($tableListings);
        }
        $topListings = sort_listings_by_distance($topListings);
    @endphp

    @foreach ($topListings as $listing)
        @php
            // $slug ko set karna listing type ke liye
            $slug = $listing->type ?? 'listing';
        @endphp

        <div class="col-sm-6 {{ get_frontend_settings('map_position') == 'right' ? 'col-sm-6' : 'col-xl-3' }} map-card">
            <div class="single-grid-card">
                <div class="grid-slider-area">
                    @php
                        $images = json_decode($listing->image);
                        $image = isset($images[0]) ? $images[0] : null;
                        $claimStatus = App\Models\ClaimedListing::where('listing_id', $listing->id)
                            ->where('listing_type', $slug)
                            ->first(); 
                        $is_in_wishlist = check_wishlist_status($listing->id, $slug);
                    @endphp
                    <a class="w-100 h-100" href="{{ route('listing.details', ['type'=>$slug, 'id'=>$listing->id, 'slug'=>slugify($listing->title)]) }}">
                        <img class="card-item-image" src="{{ $image ? get_all_image('listing-images/' . $image) : asset('assets/frontend/images/default-listing.jpg') }}">
                    </a>

                    <p class="card-light-text theme-light capitalize">{{ $listing->is_popular ?? '' }}</p>

                    <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-title="{{ $is_in_wishlist ? get_phrase('Remove from Wishlist') : get_phrase('Add to Wishlist') }}" onclick="updateWishlist(this, '{{ $listing->id }}')" class="grid-list-bookmark white-bookmark {{ $is_in_wishlist ? 'active' : '' }}">
                      <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M13.4361 3C12.7326 3.01162 12.0445 3.22023 11.4411 3.60475C10.8378 3.98927 10.3407 4.53609 10 5.18999C9.65929 4.53609 9.16217 3.98927 8.55886 3.60475C7.95554 3.22023 7.26738 3.01162 6.56389 3C5.44243 3.05176 4.38583 3.57288 3.62494 4.44953C2.86404 5.32617 2.4607 6.48707 2.50302 7.67861C2.50302 10.6961 5.49307 13.9917 8.00081 16.2262C8.56072 16.726 9.26864 17 10 17C10.7314 17 11.4393 16.726 11.9992 16.2262C14.5069 13.9917 17.497 10.6961 17.497 7.67861C17.5393 6.48707 17.136 5.32617 16.3751 4.44953C15.6142 3.57288 14.5576 3.05176 13.4361 3Z" fill="#6C1CFF" />
                                </svg>
                    </a>
                </div>

                <div class="hotel-grid-details position-relative">
                    <a href="{{ route('listing.details', ['type' => $slug, 'id' => $listing->id, 'slug' => slugify($listing->title)]) }}" class="title">
                        @if(isset($claimStatus) && $claimStatus->status == 1) 
                            <span data-bs-toggle="tooltip" data-bs-title="{{ get_phrase('This listing is verified') }}">
                                <!-- Verified SVG icon yahan rahega -->
                            </span>
                        @endif
                        {{ $listing->title }}
                    </a>

                    <div class="hotelgrid-location-rating d-flex align-items-center justify-content-between flex-wrap">
                        <div class="location d-flex">
                            <img src="{{ asset('assets/frontend/images/icons/location-gray-16.svg') }}" alt="">
                            @php
                                $city_name = App\Models\City::find($listing->city)->name ?? '';
                                $country_name = App\Models\Country::find($listing->country)->name ?? '';
                            @endphp
                            <p class="name">{{ $city_name . ', ' . $country_name }}</p>
                        </div>

                        @php
                            $reviews_count = App\Models\Review::where('listing_id', $listing->id)
                                ->where('user_id', '!=', $listing->user_id)
                                ->where('type', $slug)
                                ->where('reply_id', null)
                                ->count();
                            $total_ratings = App\Models\Review::where('listing_id', $listing->id)
                                ->where('user_id', '!=', $listing->user_id)
                                ->where('type', $slug)
                                ->where('reply_id', null)
                                ->sum('rating');
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
                            if(isset($listing->feature) && is_array(json_decode($listing->feature))){
                                $features = json_decode($listing->feature);
                                foreach ($features as $key => $item) {
                                    $feature = App\Models\Amenities::find($item);
                                    if($key < 2) echo '<li>' . removeScripts($feature->name) . '</li>';
                                }
                                if(count($features) > 4) echo "<li class='more'>+" . (count($features)-4) . ' ' . get_phrase('More') . '</li>';
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
