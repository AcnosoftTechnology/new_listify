<!DOCTYPE html>
<html lang="en">
<head>
    @include('layouts.seo')
    @include('layouts.include_top')
    @stack('css')
    
    <!-- Geolocation Config -->
    <script>
        window.enableGeolocation = {{ config('services.geolocation.enabled') ? 'true' : 'false' }};
        window.enableNotifications = {{ config('services.firebase.enabled') ? 'true' : 'false' }};
        window.showDistance = {{ config('services.geolocation.show_distance') ? 'true' : 'false' }};
        window.nearbyRadius = {{ config('services.geolocation.radius_km', 50) }};
        window.apiBaseUrl = "{{ url('/api') }}";
        window.assetPaths = {
            locationIcon: "{{ asset('assets/frontend/images/icons/location-purple-16.svg') }}",
            defaultImage: "{{ asset('assets/images/default.png') }}"
        };
    </script>
    <link rel="stylesheet" href="{{ asset('css/geolocation.css') }}">
    
</head>
@if(!empty($directory) && $directory == 'beauty')
  <body class="beauty-details-body">
@elseif((!empty($directory) && $directory == 'car'))
 <body class="car-details-body">
@elseif((!empty($directory) && $directory == 'hotel'))
 <body class="hotel-details-body">
@elseif((!empty($directory) && $directory == 'real-estate'))
 <body class="real-estate-details-body">
@elseif((!empty($directory) && $directory == 'restaurant'))
 <body class="restaurant-details-body">
@else
<body>

@endif

    <!-- Start Header Top -->
    <section class="header-top-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="header-top-area d-flex align-items-center justify-content-between flex-wrap">
                        <div id="google_translate_element"></div>
                        <ul class="header-social-list d-flex align-items-center flex-wrap">
                            <li><a href="{{get_settings('facebook')}}" target="_Blank">
                                <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M18.902 9.00006C18.902 4.02953 14.6706 0.00012207 9.45099 0.00012207C4.23135 0.00012207 0 4.02953 0 9.00006C0 13.4921 3.45607 17.2155 7.97427 17.8907V11.6016H5.57461V9.00006H7.97427V7.01726C7.97427 4.76165 9.38528 3.51572 11.5441 3.51572C12.5778 3.51572 13.6596 3.6915 13.6596 3.6915V5.90633H12.4679C11.2939 5.90633 10.9277 6.60014 10.9277 7.31257V9.00006H13.5489L13.1299 11.6016H10.9277V17.8907C15.4459 17.2155 18.902 13.4921 18.902 9.00006Z" fill="white"/>
                                </svg>                                    
                            </a></li>
                            <li><a href="{{get_settings('twitter')}}" target="_Blank">
                                <svg width="20" height="18" viewBox="0 0 20 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_8_237)">
                                    <path d="M11.5246 7.63303L18.4561 0.0529327H16.8135L10.795 6.63463L5.98794 0.0529327H0.443604L7.71277 10.0056L0.443604 17.9545H2.08623L8.44201 11.004L13.5186 17.9545H19.0629L11.5242 7.63303H11.5246ZM9.27482 10.0933L8.5383 9.10225L2.67809 1.21624H5.20107L9.93033 7.5805L10.6668 8.57156L16.8143 16.8441H14.2913L9.27482 10.0937V10.0933Z" fill="white"/>
                                    </g>
                                    <defs>
                                    <clipPath id="clip0_8_237">
                                    <rect width="19.0285" height="17.9016" fill="white" transform="translate(0.239258 0.0529327)"/>
                                    </clipPath>
                                    </defs>
                                </svg>                                    
                            </a></li>
                            <li><a href="{{get_settings('linkedin')}}" target="_Blank">
                                <svg width="20" height="18" viewBox="0 0 20 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_8_234)">
                                    <path d="M17.6483 0H1.54101C0.769421 0 0.145508 0.580074 0.145508 1.29726V16.6991C0.145508 17.4163 0.769421 17.9999 1.54101 17.9999H17.6483C18.4199 17.9999 19.0475 17.4163 19.0475 16.7026V1.29726C19.0475 0.580074 18.4199 0 17.6483 0ZM5.75334 15.3386H2.94758V6.74644H5.75334V15.3386ZM4.35046 5.57574C3.44966 5.57574 2.72238 4.88317 2.72238 4.02888C2.72238 3.17459 3.44966 2.48201 4.35046 2.48201C5.24757 2.48201 5.97485 3.17459 5.97485 4.02888C5.97485 4.87965 5.24757 5.57574 4.35046 5.57574ZM16.2528 15.3386H13.4507V11.162C13.4507 10.1671 13.4323 8.88392 11.9925 8.88392C10.5342 8.88392 10.3127 9.97025 10.3127 11.0917V15.3386H7.51433V6.74644H10.202V7.92065H10.2389C10.6117 7.24565 11.5273 6.53199 12.8896 6.53199C15.7286 6.53199 16.2528 8.31088 16.2528 10.6241V15.3386Z" fill="white"/>
                                    </g>
                                    <defs>
                                    <clipPath id="clip0_8_234">
                                    <rect width="18.902" height="17.9999" fill="white" transform="translate(0.145508)"/>
                                    </clipPath>
                                    </defs>
                                </svg>                                    
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Header Top -->

    
    @if(!empty($directory))
        @include('layouts.'.$directory.'.header')
    @else
        @include('layouts.header')
    @endif
 
    @yield('frontend_layout')

    @if(!empty($directory))
        @include('layouts.'. $directory . '.footer')
    @else
        @include('layouts.footer')
    @endif

    @include('layouts.include_bottom')
    <!-- toster file -->
    @include('layouts.toaster')
    @stack('js')
    
    @if (config('services.geolocation.enabled') || config('services.firebase.enabled'))
    <!-- Location + Notification Permission Modal -->
    <div class="modal fade location-permission-modal" id="locationPermissionModal" tabindex="-1" aria-labelledby="locationPermissionModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <div class="location-permission-modal__icon" aria-hidden="true">
                        <svg width="48" height="48" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M17.1833 7.04166C16.3083 3.19166 12.95 1.45833 9.99996 1.45833C7.04996 1.45833 3.68329 3.18333 2.80829 7.03333C1.83329 11.3333 4.46662 14.975 6.84996 17.2667C7.73329 18.1167 8.86662 18.5417 9.99996 18.5417C11.1333 18.5417 12.2666 18.1167 13.1416 17.2667C15.525 14.975 18.1583 11.3417 17.1833 7.04166ZM9.99996 11.2167C8.54996 11.2167 7.37496 10.0417 7.37496 8.59166C7.37496 7.14166 8.54996 5.96666 9.99996 5.96666C11.45 5.96666 12.625 7.14166 12.625 8.59166C12.625 10.0417 11.45 11.2167 9.99996 11.2167Z" fill="currentColor"/>
                        </svg>
                    </div>
                    <h5 class="location-permission-modal__title" id="locationPermissionModalLabel">{{ get_phrase('Enable Location & Notifications') }}</h5>
                    <p class="location-permission-modal__text">{{ get_phrase('Allow location for nearby listings, and notifications so you never miss messages or enquiry alerts — even when this tab is closed.') }}</p>
                    <div class="location-permission-modal__actions">
                        <button type="button" class="btn location-permission-modal__btn-allow" id="location-permission-allow">{{ get_phrase('Allow Access') }}</button>
                        <button type="button" class="btn location-permission-modal__btn-dismiss" id="location-permission-dismiss" data-bs-dismiss="modal">{{ get_phrase('Not Now') }}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif
  
  <style>

/* Google branding hide */
.goog-logo-link {
    display: none !important;
}

/* Extra text hide */
.goog-te-gadget {
    color: transparent !important;
    font-size: 0;
}

/* Dropdown only */
.goog-te-gadget select {
    font-size: 14px !important;
    color: #000 !important;
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: #fff;
    cursor: pointer;
}
.goog-te-gadget-simple{
    display: flex;
    justify-content: space-between;
    place-items: center;
}
.goog-te-gadget-simple span a{
     display: flex;
    flex-wrap: wrap;
    place-items: baseline;
}
  
</style>


<script>
function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'en',
        includedLanguages: 'en,hi,mr,bn,te,ta,gu,kn,ml,pa',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
    }, 'google_translate_element');
}
</script>

<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

    <!-- Geolocation Scripts -->
    <script src="{{ asset('js/geolocation.js') }}"></script>
    <script src="{{ asset('js/nearby-listings.js') }}"></script>

    @include('layouts.fcm')
    
    @if (addon_status('live_chat') == 1)
    {!!get_settings('tawk_live_chat_code')!!}
    @endif

</body>
</html>
