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

{{-- STATE --}}
<div class="col-md-4 mb-3">
    <label>
        State <span class="text-danger">*</span>
    </label>

    <select
        class="form-control"
        id="billing_state"
        name="billing_state"
        required
    >
        <option value="">Select State</option>

        @php
            $selectedState = $billing['billing_state'] ?? '';
        @endphp

        <optgroup label="States">
            <option value="Andhra Pradesh" {{ $selectedState == 'Andhra Pradesh' ? 'selected' : '' }}>Andhra Pradesh</option>
            <option value="Arunachal Pradesh" {{ $selectedState == 'Arunachal Pradesh' ? 'selected' : '' }}>Arunachal Pradesh</option>
            <option value="Assam" {{ $selectedState == 'Assam' ? 'selected' : '' }}>Assam</option>
            <option value="Bihar" {{ $selectedState == 'Bihar' ? 'selected' : '' }}>Bihar</option>
            <option value="Chhattisgarh" {{ $selectedState == 'Chhattisgarh' ? 'selected' : '' }}>Chhattisgarh</option>
            <option value="Goa" {{ $selectedState == 'Goa' ? 'selected' : '' }}>Goa</option>
            <option value="Gujarat" {{ $selectedState == 'Gujarat' ? 'selected' : '' }}>Gujarat</option>
            <option value="Haryana" {{ $selectedState == 'Haryana' ? 'selected' : '' }}>Haryana</option>
            <option value="Himachal Pradesh" {{ $selectedState == 'Himachal Pradesh' ? 'selected' : '' }}>Himachal Pradesh</option>
            <option value="Jharkhand" {{ $selectedState == 'Jharkhand' ? 'selected' : '' }}>Jharkhand</option>
            <option value="Karnataka" {{ $selectedState == 'Karnataka' ? 'selected' : '' }}>Karnataka</option>
            <option value="Kerala" {{ $selectedState == 'Kerala' ? 'selected' : '' }}>Kerala</option>
            <option value="Madhya Pradesh" {{ $selectedState == 'Madhya Pradesh' ? 'selected' : '' }}>Madhya Pradesh</option>
            <option value="Maharashtra" {{ $selectedState == 'Maharashtra' ? 'selected' : '' }}>Maharashtra</option>
            <option value="Manipur" {{ $selectedState == 'Manipur' ? 'selected' : '' }}>Manipur</option>
            <option value="Meghalaya" {{ $selectedState == 'Meghalaya' ? 'selected' : '' }}>Meghalaya</option>
            <option value="Mizoram" {{ $selectedState == 'Mizoram' ? 'selected' : '' }}>Mizoram</option>
            <option value="Nagaland" {{ $selectedState == 'Nagaland' ? 'selected' : '' }}>Nagaland</option>
            <option value="Odisha" {{ $selectedState == 'Odisha' ? 'selected' : '' }}>Odisha</option>
            <option value="Punjab" {{ $selectedState == 'Punjab' ? 'selected' : '' }}>Punjab</option>
            <option value="Rajasthan" {{ $selectedState == 'Rajasthan' ? 'selected' : '' }}>Rajasthan</option>
            <option value="Sikkim" {{ $selectedState == 'Sikkim' ? 'selected' : '' }}>Sikkim</option>
            <option value="Tamil Nadu" {{ $selectedState == 'Tamil Nadu' ? 'selected' : '' }}>Tamil Nadu</option>
            <option value="Telangana" {{ $selectedState == 'Telangana' ? 'selected' : '' }}>Telangana</option>
            <option value="Tripura" {{ $selectedState == 'Tripura' ? 'selected' : '' }}>Tripura</option>
            <option value="Uttar Pradesh" {{ $selectedState == 'Uttar Pradesh' ? 'selected' : '' }}>Uttar Pradesh</option>
            <option value="Uttarakhand" {{ $selectedState == 'Uttarakhand' ? 'selected' : '' }}>Uttarakhand</option>
            <option value="West Bengal" {{ $selectedState == 'West Bengal' ? 'selected' : '' }}>West Bengal</option>
        </optgroup>

        <optgroup label="Union Territories">
            <option value="Andaman and Nicobar Islands" {{ $selectedState == 'Andaman and Nicobar Islands' ? 'selected' : '' }}>Andaman and Nicobar Islands</option>
            <option value="Chandigarh" {{ $selectedState == 'Chandigarh' ? 'selected' : '' }}>Chandigarh</option>
            <option value="Dadra and Nagar Haveli and Daman and Diu" {{ $selectedState == 'Dadra and Nagar Haveli and Daman and Diu' ? 'selected' : '' }}>Dadra and Nagar Haveli and Daman and Diu</option>
            <option value="Delhi" {{ $selectedState == 'Delhi' ? 'selected' : '' }}>Delhi</option>
            <option value="Jammu and Kashmir" {{ $selectedState == 'Jammu and Kashmir' ? 'selected' : '' }}>Jammu and Kashmir</option>
            <option value="Ladakh" {{ $selectedState == 'Ladakh' ? 'selected' : '' }}>Ladakh</option>
            <option value="Lakshadweep" {{ $selectedState == 'Lakshadweep' ? 'selected' : '' }}>Lakshadweep</option>
            <option value="Puducherry" {{ $selectedState == 'Puducherry' ? 'selected' : '' }}>Puducherry</option>
        </optgroup>

    </select>
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


            @php
                $gstNumber = $billing['gst_number']
                    ?? auth()->user()->gst_number
                    ?? '';

                 $hasGst = !empty($billing['has_gst']) || !empty($gstNumber);
            @endphp


            {{-- GST CHECKBOX --}}
            <div class="col-12 mt-2">

                <div class="form-check">

                    <input
                        class="form-check-input"
                        type="checkbox"
                        id="has_gst"
                        name="has_gst"
                        value="1"
                        {{ $hasGst ? 'checked' : '' }}
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
                style="{{ $hasGst ? '' : 'display: none;' }}"
            >

                <label>
                    GST Number
                    <span class="text-danger">*</span>
                </label>

                <input
                    type="text"
                    class="form-control"
                    id="gst_number"
                    name="gst_number"
                    placeholder="Enter GST Number"
                    value="{{ $gstNumber }}"
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
        $(document).on('change', '#has_gst', function () {

            if ($(this).is(':checked')) {

                $('#gst_number_wrapper').slideDown(200);

            } else {

                $('#gst_number_wrapper').slideUp(200);

            }

        });
    </script>


</body>

</html>
