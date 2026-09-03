@php
    $page_data = $data['page_data'];
    $payment_details = $data['payment_details'];
    $payment_gateway = DB::table('payment_geteways')
        ->where('identifier', 'razorpay')
        ->first();
@endphp

<button id="rzp-button1" hidden>Pay</button>

<script src="{{ asset('assets/payment/style/vendors/jquery/jquery-3.7.1.min.js') }}"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
"use strict";

var options = {

    key: "{{ $page_data['razorpay_id'] }}",

    subscription_id: "{{ $page_data['subscription_id'] }}",

    name: "{{ $page_data['name'] }}",

    description: "{{ $page_data['description'] }}",

    image: "{{ get_image(auth()->user()->photo) }}",

    handler: function (response) {

        let url = "{{ route('payment.success',['identifier'=>'razorpay']) }}";

        url += "?razorpay_payment_id=" + encodeURIComponent(response.razorpay_payment_id);

        url += "&razorpay_subscription_id=" + encodeURIComponent(response.razorpay_subscription_id);

        url += "&razorpay_signature=" + encodeURIComponent(response.razorpay_signature);

        window.location.href = url;
    },

    prefill: {

        name: "{{ $page_data['name'] }}",

        email: "{{ $page_data['email'] }}",

        contact: "{{ $page_data['phone'] }}"
    },

    theme: {

        color: "#3399cc"
    }

};

var rzp = new Razorpay(options);

document.getElementById("rzp-button1").onclick = function(e){

    rzp.open();

    e.preventDefault();

};

$(function(){

    $("#rzp-button1").trigger("click");

});
</script>