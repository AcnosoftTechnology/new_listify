<style>
    .spinner-border {
        width: 3.5rem;
        height: 3.5rem;
    }
</style>



<div class="paymentWrap d-flex align-items-start flex-wrap">
    <div class="paymentLeft">
        @if(!empty($package->price) && (int)$package->price > 0)
            <p class="payment_tab_title pb-30">{{ get_phrase('Select payment gateway') }}</p>
            <!-- Tab -->
            <div class="nav flex-md-column flex-row nav-pills payment_modalTab" role="tablist" aria-orientation="vertical">
                @foreach ($payment_gateways as $key => $payment_gateway)
                    <div class="tabItem" 
                         onclick="showPaymentGatewayByAjax('{{ $payment_gateway->identifier }}')" 
                         id="{{ $payment_gateway->identifier }}-tab" 
                         data-bs-toggle="pill" 
                         data-bs-target="#{{ $payment_gateway->identifier }}" 
                         role="tab" 
                         aria-controls="{{ $payment_gateway->identifier }}" 
                         aria-selected="true">
                        <div class="payment_gateway_option d-flex align-items-center">
                            <div class="logo">
                                <img width="100px" src="{{ get_image('assets/payment/' . $payment_gateway->identifier . '.png') }}" alt="" />
                            </div>
                            <div class="info">
                                <p class="card_no">{{ $payment_gateway->title }}</p>
                                <p class="card_date"></p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif
    </div>

    

<div class="paymentRight">
    <p class="payment_tab_title pb-30">{{ get_phrase('Package Details') }}</p>

    <div class="payment_table">
        <div class="table-responsive">
            <table class="table eTable eTable-2">
                <tbody>

                    {{-- PACKAGE AMOUNT --}}
                    <tr>
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px">
                                <p>{{ $package->name }}</p>
                            </div>
                        </td>

                        @if(!empty($package->price) && (int)$package->price > 0)
                            <td>
                                <div class="dAdmin_info_name min-w-150px text-end">
                                    <p id="package_amount">
                                        {{ currency($package->price) }}
                                    </p>
                                </div>
                            </td>
                        @endif
                    </tr>


                    {{-- TOTAL / BASE AMOUNT --}}
                    <tr>
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px">
                                <p>{{ get_phrase('Total') }}</p>
                            </div>
                        </td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px text-end">
                                <p id="base_amount">
                                    {{ (int)$package->price > 0
                                        ? currency($package->price)
                                        : get_phrase('Free') }}
                                </p>
                            </div>
                        </td>
                    </tr>


                    {{-- IGST --}}
                    <tr id="igst_row" style="display: none;">
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px">
                                <p>
                                    IGST (<span id="igst_rate">18</span>%)
                                </p>
                            </div>
                        </td>

                        <td>
                            <div class="dAdmin_info_name min-w-150px text-end">
                                <p id="igst_amount">
                                    {{ currency(0) }}
                                </p>
                            </div>
                        </td>
                    </tr>


                    {{-- CGST --}}
                    <tr id="cgst_row" style="display: none;">
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px">
                                <p>
                                    CGST (<span id="cgst_rate">9</span>%)
                                </p>
                            </div>
                        </td>

                        <td>
                            <div class="dAdmin_info_name min-w-150px text-end">
                                <p id="cgst_amount">
                                    {{ currency(0) }}
                                </p>
                            </div>
                        </td>
                    </tr>


                    {{-- SGST --}}
                    <tr id="sgst_row" style="display: none;">
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px">
                                <p>
                                    SGST (<span id="sgst_rate">9</span>%)
                                </p>
                            </div>
                        </td>

                        <td>
                            <div class="dAdmin_info_name min-w-150px text-end">
                                <p id="sgst_amount">
                                    {{ currency(0) }}
                                </p>
                            </div>
                        </td>
                    </tr>


                    {{-- TOTAL TAX --}}
                    <tr id="total_tax_row" style="display: none;">
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-100px">
                                <p>
                                    {{ get_phrase('Tax') }}
                                </p>
                            </div>
                        </td>

                        <td>
                            <div class="dAdmin_info_name min-w-150px text-end">
                                <p id="total_tax">
                                    {{ currency(0) }}
                                </p>
                            </div>
                        </td>
                    </tr>


                    {{-- GRAND TOTAL --}}
                    <tr>
                        <td></td>
                        <td></td>

                        <td>
                            <div class="dAdmin_info_name min-w-150px text-end">
                                <p>
                                    <span>
                                        {{ get_phrase('Grand Total') }}:
                                        <span id="grand_total">
                                            {{ (int)$package->price > 0
                                                ? currency($package->price)
                                                : get_phrase('Free') }}
                                        </span>
                                    </span>
                                </p>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>

    <!-- Content -->
    <div class="tab-content">

        @if(!empty($package->price) && (int)$package->price > 0)

            <div
                class="tab-pane fade show active text-end"
                id="showPaymentGatewayByAjax"
            ></div>

        @else

            <div class="text-end my-3">

                <form
                    action="{{ route('package.subscribe_free', $package->id) }}"
                    method="POST"
                >
                    @csrf

                    <button type="submit" class="btn btn-primary">
                        {{ get_phrase('Subscribe Now') }}
                    </button>

                </form>

            </div>

        @endif

    </div>
</div>

</div>

<script src="https://checkout.flutterwave.com/v3.js"></script>
<script>
    const BASE_AMOUNT = {{ (float) $package->price }};
    const GST_RATE = 18;
    const CGST_RATE = GST_RATE / 2;
    const SGST_RATE = GST_RATE / 2;

    let currentTaxType = '';
    let currentTaxAmount = 0;
    let currentGrandTotal = BASE_AMOUNT;


    function formatAmount(amount) {
        return '₹' + Number(amount).toFixed(2);
    }


  function calculateGST() { 
 
    let state = $('#billing_state').val() 
        .trim() 
        .toLowerCase(); 
 
 
    // State blank hai to GST rows hide 
    if (state === '') { 
 
        $('#igst_row').hide(); 
        $('#cgst_row').hide(); 
        $('#sgst_row').hide(); 
        $('#total_tax_row').hide(); 
 
        $('#igst_amount').text(formatAmount(0)); 
        $('#cgst_amount').text(formatAmount(0)); 
        $('#sgst_amount').text(formatAmount(0)); 
        $('#total_tax').text(formatAmount(0)); 
 
        $('#grand_total').text(formatAmount(BASE_AMOUNT)); 
 
        currentTaxType = ''; 
        currentTaxAmount = 0; 
        currentGrandTotal = BASE_AMOUNT; 
 
        updatePaymentAmount(); 
 
        return; 
    } 
 
 
    // Haryana = CGST + SGST 
    if (state === 'haryana' || state === 'hr') { 
 
        let cgstAmount = 
            (BASE_AMOUNT * CGST_RATE) / 100; 
 
        let sgstAmount = 
            (BASE_AMOUNT * SGST_RATE) / 100; 
 
        let totalTax = 
            cgstAmount + sgstAmount; 
 
        let grandTotal = 
            BASE_AMOUNT + totalTax; 
 
 
        $('#igst_row').hide(); 
 
        $('#cgst_row').show(); 
        $('#sgst_row').show(); 
        $('#total_tax_row').show(); 
 
        $('#cgst_amount').text( 
            formatAmount(cgstAmount) 
        ); 
 
        $('#sgst_amount').text( 
            formatAmount(sgstAmount) 
        ); 
 
        $('#total_tax').text( 
            formatAmount(totalTax) 
        ); 
 
        $('#grand_total').text( 
            formatAmount(grandTotal) 
        ); 
 
 
        currentTaxType = 'cgst_sgst'; 
        currentTaxAmount = totalTax; 
        currentGrandTotal = grandTotal; 
    } 
 
    // Haryana ke bahar = IGST 
    else { 
 
        let igstAmount = 
            (BASE_AMOUNT * GST_RATE) / 100; 
 
        let grandTotal = 
            BASE_AMOUNT + igstAmount; 
 
 
        $('#cgst_row').hide(); 
        $('#sgst_row').hide(); 
 
        $('#igst_row').show(); 
        $('#total_tax_row').show(); 
 
        $('#igst_amount').text( 
            formatAmount(igstAmount) 
        ); 
 
        $('#total_tax').text( 
            formatAmount(igstAmount) 
        ); 
 
        $('#grand_total').text( 
            formatAmount(grandTotal) 
        ); 
 
 
        currentTaxType = 'igst'; 
        currentTaxAmount = igstAmount; 
        currentGrandTotal = grandTotal; 
    } 
 
 
    updatePaymentAmount(); 
}


/*
|--------------------------------------------------------------------------
| PAGE LOAD PAR GST RESTORE
|--------------------------------------------------------------------------
|
| User payment gateway se Back aakar is page par aaye,
| aur state pehle se filled ho, to GST automatically calculate hoga.
|
*/
$(document).ready(function() {

    let state = $('#billing_state').val();

    if (state && state.trim() !== '') {
        calculateGST();
    }

});


    function updatePaymentAmount() {

        $('.billing-payment-form input[name="price"]').val(
            currentGrandTotal.toFixed(2)
        );

    }


    // User state fill/change kare to live GST calculate
    $(document).on(
        'input change blur',
        '#billing_state',
        function() {
            calculateGST();
        }
    );
</script>
<script type="text/javascript">
    "use strict";

    function showPaymentGatewayByAjax(identifier) {
        $('#showPaymentGatewayByAjax').html(
            '<div class="w-100 text-center my-5"><div class="spinner-border" role="status"><span class="visually-hidden"></span></div></div>'
        );

        $.ajax({
            url: "{{ route('payment.show_payment_gateway_by_ajax', '') }}/" + identifier,
            success(response) {
                $('#showPaymentGatewayByAjax').html(response);
            }
        });
    }
</script>




