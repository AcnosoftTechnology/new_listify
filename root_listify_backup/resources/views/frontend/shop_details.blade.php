<style>
    .text-right{
        text-align: right;
    }
    .list-group-item{
        font-size: 14px;
    }
    .list-group-item small{
        font-size: 13px;
    }
    .text-right p {
	font-size: 14px;
	font-weight: 500;
	color: #000;
	margin-top: 7px;
}
.border-none{
    border: none !important;
}
.inventory img {
	height: 100px;
    width: 100px;
    object-fit: cover;
    border-radius: 10px;
}
.inventory .figure-body p {
	color: #000;
}
.modal-content {
	border-radius: 20px;
}
.restdetails-agent-header {
	padding-bottom: 20px;
}
.inventory .price {
	color: rgba(36, 45, 61, 1);
}
.titles {
	text-align: center;
	display: inherit;
	font-weight: 600;
    font-size: 16px;
	color: var(--darkColor);
	margin-top: 16px;
}
.restdetails-agent{
    border-top: 1px solid rgba(208, 210, 216, 1);
    padding: 8px 0;
}
.restdetails-agent  .title{
    font-size: 16px;
    font-weight: 600;
    color: var(--darkColor);
}
.restdetails-agent p{
    font-size: 16px;
    font-weight: 600;
    color: var(--darkColor);
}
#orderSummaryList {
    overflow-y: auto;
    padding-right: 5px;
}

.scroll-enabled {
    max-height: 400px;
}
 
.review-textarea{
 min-height:inherit!important;
}
</style>

<!-- Order Summary -->
<form class="row" action="{{ route('inventory.order') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <div class="col-lg-5 col-md-5">
        <div class="row">
            <div class="col-lg-12 shopItemCard">
                <div class="restdetails-agent-header border-none">
                    <h3 class="title">{{ get_phrase('Your Order') }}</h3>
                </div>

                <ul class="inventory flex-column" id="orderSummaryList">
                    <!-- Items will be appended here via JS -->
                </ul>
            </div>
        </div>

        <div class="order-summary mt-2">
            <div class="restdetails-agent d-flex justify-content-between">
                <h3 class="title">{{ get_phrase('Total') }}:</h3>
                <p><span id="totalPrice">{{ currency(0.00) }}</span></p>
            </div>
        </div>      
      
            

<!-- QR Code Div -->
<div id="upi-section">
    <div style="margin-top:15px;display:grid;justify-content:center;width:100%;text-align:center;">

        @php
            use App\Models\CustomListings;
            use App\Models\HotelListing;
            use App\Models\CarListing;
            use App\Models\RealEstateListing;
            use App\Models\RestaurantListing;
            use App\Models\BeautyListing;
            use App\Models\Qrcode;

            /*
            |--------------------------------------------------------------------------
            | FIND LISTING MODEL
            |--------------------------------------------------------------------------
            */

            $creator_new = null;

            switch ($type) {

                case 'hotel':
                    $creator_new = HotelListing::where('id', $listing_id)->first();
                    break;

                case 'car':
                    $creator_new = CarListing::where('id', $listing_id)->first();
                    break;

                case 'realestate':
                    $creator_new = RealEstateListing::where('id', $listing_id)->first();
                    break;

                case 'restaurant':
                    $creator_new = RestaurantListing::where('id', $listing_id)->first();
                    break;

                case 'beauty':
                    $creator_new = BeautyListing::where('id', $listing_id)->first();
                    break;

                default:
                    $creator_new = CustomListings::where('type', $type)
                                    ->where('id', $listing_id)
                                    ->first();
                    break;
            }

            /*
            |--------------------------------------------------------------------------
            | GET USER QR
            |--------------------------------------------------------------------------
            */

            $user_qr = null;

            if ($creator_new && $creator_new->user_id) {

                $user_qr = Qrcode::where('user_id', $creator_new->user_id)
                                ->where('status', 1)
                                ->first();
            }

        @endphp

        @if ($creator_new && $user_qr && $user_qr->qrcode && $user_qr->upiid)

            <h4 style="margin-bottom:15px;color:#000;">
                Scan & Pay via UPI
            </h4>

            <!-- QR IMAGE -->
            <img
                src="{{ url('public/uploads/qrcodes/'.$user_qr->qrcode) }}"
                style="width:150px;height:auto;margin:auto;"
                alt="UPI QR Code"
            >

            <!-- UPI ID -->
            <div style="margin-top:15px;">

                <p style="margin-bottom:8px;font-weight:600;color:#000;">
                    UPI ID
                </p>

                <button
                    type="button"
                    onclick="copyUpiId()"
                    style="
                        border:none;
                        background:#f5f5f5;
                        padding:10px 15px;
                        border-radius:6px;
                        cursor:pointer;
                        font-weight:600;
                    "
                >
                    {{ $user_qr->upiid }}
                </button>

                <p
                    id="copy-message"
                    style="color:green;font-size:14px;margin-top:8px;display:none;"
                >
                    UPI ID Copied!
                </p>

            </div>

        @else

            <p style="color:red;">
                UPI QR code not available for this listing.
            </p>

        @endif

    </div>
  
                      
          <div id="upi-section-field" style="display:none;margin-top:10px;">
            <div class="mb-2">
              <input type="text" class="form-control ua-form-control" name="txn_id" placeholder="{{ get_phrase('Transaction ID') }}">
            </div>
            <div class="mb-2">
              <label for="payment_image" class="form-label">{{ get_phrase('Payment Screenshort') }}</label>
              <input type="file" id="payment_image" class="form-control ua-form-control" name="payment_image">
            </div>
          </div>
  
  
</div>

      
    </div>

    <div class="col-lg-7 col-md-7">
        <div class="restdetails-agent-header border-none">
            <h3 class="title">{{ get_phrase('Delivery details') }}</h3>
        </div>

        <div class="reportForm">
            <input type="hidden" name="product_ids" id="product_ids">
            <input type="hidden" name="type" value="{{ $type }}">
            <input type="hidden" name="listing_id" value="{{ $listing_id }}">
            <input type="hidden" name="listing_creator_id" id="listing_creator_id" value="">


            @php
                if ($type == 'beauty') {
                    $creator = App\Models\BeautyListing::find($listing_id);
                } elseif ($type == 'hotel') {
                    $creator = App\Models\HotelListing::find($listing_id);
                } elseif ($type == 'car') {
                    $creator = App\Models\CarListing::find($listing_id);
                } elseif ($type == 'restaurant') {
                    $creator = App\Models\RestaurantListing::find($listing_id);
                } elseif ($type == 'real-estate') {
                    $creator = App\Models\RealEstateListing::find($listing_id);
                }

            @endphp

            <input type="hidden" name="amount" id="total_amount">

         @php
             $user = Auth::user();
         @endphp

          <div class="mb-2">
            <input type="text" class="form-control ua-form-control" name="customer_name" placeholder="{{ get_phrase('Full Name') }}" value="{{ $user ? $user->name : '' }}" required>
          </div>

          <div class="mb-2">
            <input type="email" class="form-control ua-form-control" name="customer_email" placeholder="{{ get_phrase('Email') }}" value="{{ $user ? $user->email : '' }}" required>
          </div>

          <div class="mb-2">
            <input type="number" class="form-control ua-form-control" name="customer_phone" placeholder="{{ get_phrase('Phone Number') }}" value="{{ $user && $user->phone ? $user->phone : '' }}" required>
          </div>

          <div class="mb-2">
            <input type="text" class="form-control ua-form-control" name="customer_address" placeholder="{{ get_phrase('Address') }}" value="{{ $user && $user->addressline ? $user->addressline : '' }}" required>
          </div>

           <div class="mb-2">
              <textarea class="form-control mform-control review-textarea" name="customer_message" placeholder="{{ get_phrase('Any Note') }}" required></textarea>
          </div>

          
          <div class="mb-3">

            <div class="form-check checknote_modal">
              <input class="form-check-input" type="checkbox" name="note" id="note" checked required>
              <label class="form-check-label" for="note">
                I agree to the Note
              </label>
            </div>

            <div class="form-check checkterms_modal">
              <input class="form-check-input" type="checkbox" name="terms" id="terms" required checked>
              <label class="form-check-label" for="terms">
                I agree to the Terms & Conditions
              </label>
            </div>

            <div class="form-check checkshipping_modal">
              <input class="form-check-input" type="checkbox" name="shipping" id="shipping" required checked>
              <label class="form-check-label" for="shipping">
                I agree to the Shipping Policy
              </label>
            </div>

          </div>
 
  
        <div>

              
            <div style="margin-bottom:10px; display:flex; flex-wrap:wrap;">
              <label style="font-size: 17px;font-weight: 600;color: #000;border: 1px solid #c3c3c3;padding: 10px;border-radius: 10px;margin-right:5px; cursor:pointer;">
                <input type="radio" name="payment_method" value="cod">
                {{ get_phrase('Cash on Delivery') }}
              </label>
             @if ($creator_new && $user_qr && $user_qr->qrcode)
              <label style="font-size: 17px;font-weight: 600;color: #000;border: 1px solid #c3c3c3;padding: 10px;border-radius: 10px;margin-right:5px; cursor:pointer;">
                <input type="radio" name="payment_method" value="upi">
                {{ get_phrase('Pay via UPI') }}
              </label>
              @endif
            </div>

           
            <button type="submit" class="submit-fluid-btn2 new_order_tab">{{ get_phrase('Confirm This Order') }}</button>

            </div>
        </div>
    </div>
</form>

<script>

    function copyUpiId() {

        let upiId = "{{ $user_qr->upiid ?? '' }}";

        navigator.clipboard.writeText(upiId);

        document.getElementById('copy-message').style.display = 'block';

        setTimeout(() => {

            document.getElementById('copy-message').style.display = 'none';

        }, 2000);
    }

</script>


<script>
 // Allow nested modals
$(document).on('show.bs.modal', '.modal', function () {
  const zIndex = 1040 + 10 * $('.modal:visible').length;
  $(this).css('z-index', zIndex);
  setTimeout(() => {
    $('.modal-backdrop').not('.modal-stack')
      .css('z-index', zIndex - 1)
      .addClass('modal-stack');
  }, 0);
});

</script>




<script>
  document.querySelectorAll('input[name="payment_method"]').forEach((radio) => {
    radio.addEventListener('change', function() {
      let upiDiv = document.getElementById("upi-section");
      let upiField = document.getElementById("upi-section-field");

      if (this.value === "upi") {
        upiDiv.style.display = "block";
        upiField.style.display = "block";
      } else {
        upiDiv.style.display = "none";
        upiField.style.display = "none";
      }
    });
  });
</script>

<!-- JS to Populate Order Summary -->
<script>
    $(document).ready(function () {
        const currencySymbol = "{{ currency() }}";
        let selectedItems = JSON.parse(sessionStorage.getItem('selectedItems'));

        if (selectedItems && selectedItems.length > 0) {
            let totalAmount = 0;
            let productData = [];

            let orderSummaryHtml = '';
            selectedItems.forEach(item => {
                totalAmount += item.total;

                productData.push({
                    product_id: item.product_id,
                    quantity: item.quantity,
                    price: item.price
                });

                orderSummaryHtml += `
                    <li class="d-flex gap-3 mb-2">
                        <figure class="mb-0">
                            <a href="javascript:;" class="veno-gallery-img w-100">
                                <img src="${item.image || '{{ asset('assets/frontend/images/hotel/bg-card-banner2.webp') }}'}" alt="." style="max-width: 100px;">
                            </a>
                        </figure>
                        <div class="figure-body w-100">
                            <div class="fTitile">
                                <h4>${item.name}</h4>
                            </div>
                            <div class="product-container d-flex justify-content-between align-items-start">
                                <p class="name">Quantity: ${item.quantity}</p>
                                <span class="price">${currencySymbol}${item.total.toFixed(2)}</span>
                            </div>
                        </div>
                    </li>
                `;
            });

            $('#orderSummaryList').html(orderSummaryHtml);
            $('#totalPrice').text(`${currencySymbol}${totalAmount.toFixed(2)}`);
            $('#product_ids').val(JSON.stringify(productData));
            $('#total_amount').val(totalAmount.toFixed(2));

            // Enable scroll if more than 2 items
            if (selectedItems.length > 3) {
                $('#orderSummaryList').addClass('scroll-enabled');
            } else {
                $('#orderSummaryList').removeClass('scroll-enabled');
            }

        } else {
            $('#orderSummaryList').html('<p class="text-center">No items selected</p>');
            $('#totalPrice').text(`${currencySymbol}0.00`);
            $('#orderSummaryList').removeClass('scroll-enabled');
        }
    });
</script>
