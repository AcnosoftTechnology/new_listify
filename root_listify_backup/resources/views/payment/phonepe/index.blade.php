@php
    $model = $payment_details['success_method']['model_name'];

    if ($model == 'InstructorPayment') {
        $payment_keys = DB::table('users')
            ->where('id', $payment_details['items'][0]['id'])
            ->value('paymentkeys');

        $keys = isset($payment_keys) ? json_decode($payment_keys) : null;

        $client_id = $client_secret = '';
        if ($keys && isset($keys->phonepe)) {
            $client_id = $keys->phonepe->client_id;
            $client_secret = $keys->phonepe->client_secret;
        }

        if ($client_id == '' || $client_secret == '') {
            $msg = get_phrase('This payment gateway is not configured.');
        }
    } else { 
        $payment_gateway = DB::table('payment_geteways')->where('identifier', 'phonepe')->first();
        $client_id = $client_secret = '';

        if ($payment_gateway->keys != '') {
            if ($payment_gateway->status == 1) {
                $keys = json_decode($payment_gateway->keys, true);
                $client_id = $keys['client_id'] ?? '';
                $client_secret = $keys['client_secret'] ?? '';

                if ($client_id == '' || $client_secret == '') {
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

@if ($client_id != '' && $client_secret != '')
    <form id="phonepe_payment_form">
        <button type="button" id="phonepe_submit_btn" class="btn btn-primary">
            {{ get_phrase('Pay with PhonePe') }}
        </button>
    </form>
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

<script src="{{ asset('assets/payment/style/vendors/jquery/jquery-3.7.1.min.js') }}"></script>
<script>
    $(document).ready(function() {
        $('#phonepe_submit_btn').click(function() {
            // Show loading indicator
            $('#phonepe_payment_form').html(`
                <div class="text-center py-3">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <p class="mt-2">{{ get_phrase('Initiating PhonePe payment...') }}</p>
                </div>
            `);
            
            // Get fresh CSRF token
            $.get('/refresh-csrf', function(response) {
                $.ajax({
                    url: "{{ route('phonepe.initiate') }}",
                    method: 'POST',
                    data: {
                        _token: response.token,
                        amount: "{{ $payment_details['payable_amount'] }}"
                    },
                    headers: {
                        'X-CSRF-TOKEN': response.token
                    },
                    success: function(response) {
                        if (response.success && response.redirect_url) {
                            window.location.href = response.redirect_url;
                        } else {
                            alert(response.message || 'Payment initiation failed');
                            window.location.reload();
                        }
                    },
                    error: function(xhr) {
                        alert('Error: ' + (xhr.responseJSON?.message || 'Payment initiation failed'));
                        window.location.reload();
                    }
                });
            });
        });
    });
</script>