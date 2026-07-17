@php
    $payment_details = $data['payment_details'];
    $payment_gateway = DB::table('payment_geteways')->where('identifier', 'phonepe')->first();
    $keys = json_decode($payment_gateway->keys, true);
@endphp

<script src="{{ asset('assets/payment/style/vendors/jquery/jquery-3.7.1.min.js') }}"></script>
<script>
    "use strict";

    $(document).ready(function() {
        // Submit the form automatically
        $('form[name="phonepe_payment_form"]').submit();
    });
</script>

<form name="phonepe_payment_form" action="{{ route('payment.create', 'phonepe') }}" method="POST">
    @csrf
    <input type="hidden" name="amount" value="{{ $payment_details['payable_amount'] }}">
</form>

<div class="text-center py-5">
    <div class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
    <p class="mt-3">{{ get_phrase('Redirecting to PhonePe...') }}</p>
</div>