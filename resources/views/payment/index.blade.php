<!DOCTYPE html>
<html lang="en">

<head>
    @php
        $system_name = \App\Models\System_setting::where('key', 'system_title')->value('value');
        $system_favicon = \App\Models\System_setting::where('key', 'favicon_logo')->value('value');
    @endphp
    <title>{{ $system_name }}</title>
    <!-- all the meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- CSRF Token for ajax for submission -->
    <meta name="csrf_token" content="{{ csrf_token() }}" />
    <!-- all the css files -->
    <!-- fav icon -->
    <link rel="shortcut icon" href="{{ asset('uploads/logo/' . get_frontend_settings('favicon_logo')) }}" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/payment/style/vendors/bootstrap-5.1.3/css/bootstrap.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/payment/style/css/swiper-bundle.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/payment/style/css/custom.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/payment/style/css/style.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/payment/style/vendors/bootstrap-icons-1.8.1/bootstrap-icons.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/icons/uicons-regular-rounded/css/uicons-regular-rounded.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/payment/style/css/own.css') }}" />
    <!--Main Jquery-->
    <script src="{{ asset('assets/payment/style/vendors/jquery/jquery-3.7.1.min.js') }}"></script>
    <style>
        .main_content {
            min-height: calc(100% - 50px);
            margin-top: 0px !important;
        }
        [data-bs-target="#doku"] img {
                height: 40px;
                width: auto;
            }

    </style>
</head>

<body class="pt-5">
    @if (session('app_url'))
        @include('payment.go_back_to_mobile_app')
    @endif
<div class="main_content paymentContent">
        <div class="main_content paymentContent">

    <div class="paymentHeader d-flex justify-content-between align-items-center">
        <h5 class="title">{{ get_phrase('Order summary') }}</h5>

        <a href="{{ route('pricing') }}" class="btn btn-light text-sm">
            <i class="fi-rr-cross-small"></i>
            {{ get_phrase('Cancel Payment') }}
        </a>
    </div>
    
    {{-- BILLING DETAILS FORM --}}

    @php
    $billing = $payment_details['billing_details'] ?? [];
@endphp

{{-- BILLING DETAILS FORM --}}
<div class="billing-details-wrapper" style="padding:50px;">

    @php
        $billing = $payment_details['billing_details'] ?? [];
    @endphp

    <div class="billing-card">

        <h4>Billing Details</h4>

        <div class="row">

            {{-- FULL NAME --}}
            <div class="col-md-6 mb-3">
                <label>
                    Full Name <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="billing_name"
                    value="{{ $billing['billing_name'] ?? auth()->user()->name ?? '' }}"
                >
            </div>


            {{-- EMAIL --}}
            <div class="col-md-6 mb-3">
                <label>
                    Email <span class="text-danger">*</span>
                </label>

                <input
                    type="email"
                    class="form-control"
                    id="billing_email"
                    value="{{ $billing['billing_email'] ?? auth()->user()->email ?? '' }}"
                >
            </div>


            {{-- PHONE --}}
            <div class="col-md-6 mb-3">
                <label>
                    Phone Number <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="billing_phone"
                    value="{{ $billing['billing_phone'] ?? auth()->user()->phone ?? '' }}"
                >
            </div>


            {{-- COUNTRY --}}
            <div class="col-md-6 mb-3">
                <label>
                    Country <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="billing_country"
                    value="{{ $billing['billing_country'] ?? 'India' }}"
                >
            </div>


            {{-- ADDRESS --}}
            <div class="col-12 mb-3">
                <label>
                    Address <span class="text-danger">*</span>
                </label>

                <textarea
                    class="form-control"
                    id="billing_address"
                    rows="3"
                >{{ $billing['billing_address'] ?? '' }}</textarea>
            </div>


            {{-- CITY --}}
            <div class="col-md-4 mb-3">
                <label>
                    City <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="billing_city"
                    value="{{ $billing['billing_city'] ?? '' }}"
                >
            </div>


            {{-- STATE --}}
            <div class="col-md-4 mb-3">
                <label>
                    State <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="billing_state"
                    value="{{ $billing['billing_state'] ?? '' }}"
                >
            </div>


            {{-- PINCODE --}}
            <div class="col-md-4 mb-3">
                <label>
                    Pincode <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="billing_pincode"
                    value="{{ $billing['billing_pincode'] ?? '' }}"
                >
            </div>


            {{-- GST CHECKBOX --}}
            <div class="col-12 mt-2">

                <div class="form-check">

                    <input
                        class="form-check-input"
                        type="checkbox"
                        id="has_gst"
                        {{ !empty($billing['has_gst']) ? 'checked' : '' }}
                    >

                    <label
                        class="form-check-label"
                        for="has_gst"
                    >
                        I have a GST Number
                    </label>

                </div>

            </div>


            {{-- GST NUMBER --}}
            <div
                class="col-md-6 mt-3"
                id="gst_number_wrapper"
                style="{{ !empty($billing['has_gst']) ? '' : 'display:none;' }}"
            >

                <label>
                    GST Number
                    <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="gst_number"
                    placeholder="Enter GST Number"
                    value="{{ $billing['gst_number'] ?? '' }}"
                >

            </div>

        </div>

    </div>
</div>

        @include('payment.payment_gateway')
</div>
    <!--Bootstrap bundle with popper-->
    <script src="{{ asset('assets/payment/style/vendors/bootstrap-5.1.3/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/payment/style/js/swiper-bundle.min.js') }}"></script>
    <!-- Datepicker js -->
    <script src="{{ asset('assets/payment/style/js/moment.min.js') }}"></script>
    <script src="{{ asset('assets/payment/style/js/sweetalert2@11.js') }}"></script>
    <!-- toster file -->
   
    <script>
    $(document).ready(function() {

        $('#has_gst').on('change', function() {

            if ($(this).is(':checked')) {
                $('#gst_number_wrapper').slideDown();
            } else {
                $('#gst_number_wrapper').slideUp();
                $('#gst_number').val('');
            }

        });

    });
</script>


</body>

</html>
