@php
    $model = $payment_details['success_method']['model_name'];

    if ($model == 'InstructorPayment') {
        $payment_keys = DB::table('users')
            ->where('id', $payment_details['items'][0]['id'])
            ->value('paymentkeys');

        $keys = isset($payment_keys) ? json_decode($payment_keys) : null;

        $public_key = $secret_key = '';
        if ($keys) {
            $public_key = $keys->razorpay->public_key;
            $secret_key = $keys->razorpay->secret_key;
        }

        if ($public_key == '' || $secret_key == '') {
            $msg = get_phrase('This payment geteway is not configured.');
        }
    } else { 
        $payment_gateway = DB::table('payment_geteways')->where('identifier', 'razorpay')->first();
        $public_key = $secret_key = '';

        if ($payment_gateway->keys != '') {
            if ($payment_gateway->status == 1) {
                $keys = json_decode($payment_gateway->keys, true);
                $public_key = $keys['public_key'];
                $secret_key = $keys['secret_key'];

                if ($public_key == '' || $secret_key == '') {
                    $msg = get_phrase('This payment gateway is not configured.');
                }
            } else {
                $msg = get_phrase('Admin denied transaction through this gateway.');
            }
        } else {
            $msg = get_phrase('This payment gateway is not configured.');
        }
    }
@endphp

@if ($public_key != '' && $secret_key != '')
    <!-- <form action="{{ route('razorpay.order', $payment_gateway->identifier) }}" method="post">
        @csrf
        <input type="hidden" name="price" value="{{ $payment_details['payable_amount'] }}">
        <button type="submit" class="btn btn-primary">{{ get_phrase('Pay by Razorpay') }}</button>
    </form> -->
    @php
    $period = strtolower(trim($payment_details['items'][0]['period']));
@endphp

@if($period == 'monthly' || $period == 'annually')


    {{-- Razorpay Auto Subscription --}}
    <form
        action="{{ route('razorpay.subscription', $payment_gateway->identifier) }}"
        method="post"
        class="billing-payment-form"
        id="razorpaySubscriptionForm"
    >
        @csrf

        <input
            type="hidden"
            name="price"
            value="{{ $payment_details['payable_amount'] }}"
        >

        <button type="submit" class="btn btn-primary">
            {{ get_phrase('Subscribe with Razorpay') }}
        </button>
    </form>

@else

    {{-- Existing One Time Payment --}}
    <form action="{{ route('razorpay.order', $payment_gateway->identifier) }}"
          method="post"
          class="billing-payment-form">
        @csrf

        <input type="hidden"
               name="price"
               value="{{ $payment_details['payable_amount'] }}">

        <button type="submit" class="btn btn-primary">
            {{ get_phrase('Pay by Razorpay') }}
        </button>
    </form>

@endif

@else
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none;">
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </symbol>
    </svg>

    <div class="alert alert-danger d-flex align-items-center" role="alert">
        <svg class="bi me-2 flex-shrink-0" width="24" height="24" role="img" aria-label="Danger:">
            <use xlink:href="#exclamation-triangle-fill" />
        </svg>
        <div class="payment_err_msg">
            <b>{{ get_phrase('Opps!') }}</b> {{ $msg }}<br>
            {{ get_phrase('Try another gateway.') }}
        </div>
    </div>
@endif



<script>
    function saveBillingDetails(callback, errorCallback) {

        let hasGst = $('#has_gst').is(':checked') ? 1 : 0;


        /*
        |--------------------------------------------------------------------------
        | LATEST GST VALUES
        |--------------------------------------------------------------------------
        */

        let packageAmount = Number(BASE_AMOUNT) || 0;

        let igstAmount = 0;
        let cgstAmount = 0;
        let sgstAmount = 0;
        let totalTaxAmount = 0;
        let grandTotal = packageAmount;


        if (currentTaxType === 'igst') {

            igstAmount = Number(currentTaxAmount) || 0;
            totalTaxAmount = igstAmount;
            grandTotal = packageAmount + totalTaxAmount;

        } else if (currentTaxType === 'cgst_sgst') {

            cgstAmount = (packageAmount * Number(CGST_RATE)) / 100;
            sgstAmount = (packageAmount * Number(SGST_RATE)) / 100;

            totalTaxAmount = cgstAmount + sgstAmount;
            grandTotal = packageAmount + totalTaxAmount;

        }


        /*
        |--------------------------------------------------------------------------
        | GLOBAL FINAL AMOUNT UPDATE
        |--------------------------------------------------------------------------
        */

        currentGrandTotal = grandTotal;


        /*
        |--------------------------------------------------------------------------
        | AJAX DATA
        |--------------------------------------------------------------------------
        */

        let billingData = {

            // =========================
            // BILLING DETAILS
            // =========================

            billing_name: $('#billing_name').val(),
            billing_email: $('#billing_email').val(),
            billing_phone: $('#billing_phone').val(),
            billing_address: $('#billing_address').val(),
            billing_city: $('#billing_city').val(),
            billing_state: $('#billing_state').val(),
            billing_country: $('#billing_country').val(),
            billing_pincode: $('#billing_pincode').val(),


            // =========================
            // GST DETAILS
            // =========================

            has_gst: hasGst,
            gst_number: $('#gst_number').val(),


            // =========================
            // PACKAGE AMOUNT
            // =========================

            package_amount: packageAmount.toFixed(2),


            // =========================
            // IGST / CGST / SGST
            // =========================

            igst_amount: igstAmount.toFixed(2),

            cgst_amount: cgstAmount.toFixed(2),

            sgst_amount: sgstAmount.toFixed(2),


            // =========================
            // TOTAL TAX
            // =========================

            total_tax_amount: totalTaxAmount.toFixed(2),


            // =========================
            // FINAL AMOUNT WITH GST
            // Example: 500 + 90 = 590
            // =========================

            grand_total: grandTotal.toFixed(2),


            // =========================
            // CSRF TOKEN
            // =========================

            _token: $('meta[name="csrf_token"]').attr('content')
        };


        /*
        |--------------------------------------------------------------------------
        | DEBUG - TEMPORARY
        |--------------------------------------------------------------------------
        |
        | Browser console mein check kar sakte ho
        |
        */

        console.log('Billing Payment Data:', billingData);


        /*
        |--------------------------------------------------------------------------
        | AJAX REQUEST
        |--------------------------------------------------------------------------
        */

        $.ajax({

            url: "{{ route('payment.save.billing.details') }}",

            type: "POST",

            data: billingData,


            success: function(response) {

                if (response.status) {


                    /*
                    |--------------------------------------------------------------------------
                    | SERVER KA FINAL AMOUNT
                    |--------------------------------------------------------------------------
                    */

                    if (
                        response.grand_total !== undefined &&
                        response.grand_total !== null
                    ) {

                        currentGrandTotal = parseFloat(
                            response.grand_total
                        );


                        /*
                        |--------------------------------------------------------------------------
                        | SABHI PAYMENT FORMS KA PRICE UPDATE
                        |--------------------------------------------------------------------------
                        */

                        $('.billing-payment-form input[name="price"]').val(
                            currentGrandTotal.toFixed(2)
                        );

                    } else {

                        /*
                        |--------------------------------------------------------------------------
                        | AGAR SERVER RESPONSE MEIN GRAND TOTAL NA AAYE
                        |--------------------------------------------------------------------------
                        */

                        $('.billing-payment-form input[name="price"]').val(
                            grandTotal.toFixed(2)
                        );
                    }


                    if (typeof callback === 'function') {
                        callback(response);
                    }

                } else {

                    if (typeof errorCallback === 'function') {
                        errorCallback();
                    }

                }

            },


            error: function(xhr) {

                let message =
                    'Please fill all required billing details.';


                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.errors
                ) {

                    let errors = xhr.responseJSON.errors;

                    message = Object.values(errors)
                        .map(function(error) {
                            return error[0];
                        })
                        .join('<br>');
                }


                Swal.fire({
                    icon: 'error',
                    title: 'Billing Details Required',
                    html: message
                });


                if (typeof errorCallback === 'function') {
                    errorCallback();
                }

            }

        });
    }


    /*
    |--------------------------------------------------------------------------
    | PAYMENT FORM SUBMIT
    |--------------------------------------------------------------------------
    */

    $(document).on(
        'submit',
        '.billing-payment-form',
        function(e) {

            e.preventDefault();


            let paymentForm = this;

            let submitButton = $(paymentForm)
                .find('button[type="submit"]');


            /*
            |--------------------------------------------------------------------------
            | DOUBLE CLICK ROKO
            |--------------------------------------------------------------------------
            */

            if (submitButton.prop('disabled')) {
                return;
            }


            /*
            |--------------------------------------------------------------------------
            | SUBMIT SE PEHLE LATEST GST CALCULATE KARO
            |--------------------------------------------------------------------------
            */

            if (typeof calculateGST === 'function') {
                calculateGST();
            }


            /*
            |--------------------------------------------------------------------------
            | LATEST AMOUNT PAYMENT INPUT MEIN SET KARO
            |--------------------------------------------------------------------------
            */

            if (typeof currentGrandTotal !== 'undefined') {

                $(paymentForm)
                    .find('input[name="price"]')
                    .val(
                        Number(currentGrandTotal).toFixed(2)
                    );
            }


            /*
            |--------------------------------------------------------------------------
            | BUTTON DISABLE
            |--------------------------------------------------------------------------
            */

            submitButton.prop('disabled', true);

            submitButton.text('Processing...');


            /*
            |--------------------------------------------------------------------------
            | PEHLE BILLING + GST AMOUNTS SAVE KARO
            |--------------------------------------------------------------------------
            */

            saveBillingDetails(

                function(response) {


                    /*
                    |--------------------------------------------------------------------------
                    | SERVER KA FINAL AMOUNT
                    |--------------------------------------------------------------------------
                    */

                    if (
                        response.grand_total !== undefined &&
                        response.grand_total !== null
                    ) {

                        currentGrandTotal = parseFloat(
                            response.grand_total
                        );

                    }


                    /*
                    |--------------------------------------------------------------------------
                    | FINAL AMOUNT HIDDEN PRICE INPUT MEIN
                    |--------------------------------------------------------------------------
                    */

                    $(paymentForm)
                        .find('input[name="price"]')
                        .val(
                            Number(currentGrandTotal).toFixed(2)
                        );


                    /*
                    |--------------------------------------------------------------------------
                    | AB ACTUAL RAZORPAY FORM SUBMIT HOGA
                    |--------------------------------------------------------------------------
                    */

                    HTMLFormElement.prototype.submit.call(
                        paymentForm
                    );

                },


                function() {


                    /*
                    |--------------------------------------------------------------------------
                    | VALIDATION / AJAX ERROR
                    |--------------------------------------------------------------------------
                    */

                    submitButton.prop('disabled', false);

                    submitButton.text(
                        'Subscribe with Razorpay'
                    );

                }

            );

        }
    );
</script>