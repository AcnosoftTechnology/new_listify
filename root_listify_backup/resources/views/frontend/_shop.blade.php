
<style>
    .orderBtn {
        margin-top: 20px;
        text-align: center;
    }
    .orderBtn a {
        margin: auto;
    }
    .shopdescription .car-filter-btn{
    background: rgba(244, 245, 247, 1);
}
.shopdescription .car-filter-btn:hover{
    background: var(--themeColor);
}
.shopdescription .mixitup-control-active{
    background: var(--themeColor) !important;
    color: #fff !important;
}
</style>
<script src="{{ asset('assets/frontend/js/mixitup.min.js') }}"></script>
<div class="at-details-description shopdescription mb-50px mt-5">
    <h4 class="title mb-16">{{ get_phrase('Shop products') }}</h4>

    <div class="row mb-4 mt-4">
        <div class="col-12">
            <div class="d-flex gap-14px  flex-wrap">
                <button type="button" data-filter="all" class="btn car-filter-btn mixitup-control-active">{{ get_phrase('All') }}</button>
                @foreach ($shopCategories as $category)
                    <button type="button" data-filter=".{{ 'category-' . $category->id }}" class="btn car-filter-btn">
                        {{ $category->name }}
                    </button>
                @endforeach
            </div>
        </div>
    </div>

    <div class="row mixitup g-2"  id="shopItemsContainer">
        @foreach($shopItems as $shop)
           <div class="col-lg-6 col-md-6 shopItemCard mix {{ 'category-' . $shop->category_id }}">
                <div class="shopCard">
                    <figure>
                        <a href="{{ get_all_image('inventory/'.$shop->image) }}" class="veno-gallery-img w-100 d-block">
                            <img src="{{ get_all_image('inventory/'.$shop->image) }}" alt="...">
                        </a>
                        <input type="hidden" class="product-id" value="{{ $shop->id }}">
                    </figure>
                    <div class="figure-body">
                        <div class="fTitile d-flex justify-content-between">
                           <h4>{{ $shop->name }}</h4>                           
                        </div>
                        <p class="mb-2 name">{{ $shop->description }}</p>
                          <div class="product-container">
                            <span class="price" data-price="{{ $shop->sale_price ?? $shop->price }}">
                                @if($shop->sale_price && $shop->price)
                                    <span class="old-price" style="margin-right: 5px; text-decoration: line-through; font-size: smaller; color: red;">
                                        {{ currency($shop->price) }}
                                    </span>
                                    <span class="sale-price">
                                        {{ currency($shop->sale_price) }}
                                    </span>
                                @else
                                    <span class="sale-price">
                                        {{ currency($shop->sale_price ?? $shop->price) }}
                                    </span>
                                @endif
                            </span>                       
                            <div class="quantity-selector">
                                <button class="quantity-btn minus">−</button>
                                <span class="quantity">0</span>
                                <button class="quantity-btn plus">+</button>                                
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <div class="orderBtn d-flex justify-content-center">
        <div>
            <div id="clearFilterWrapper" style="display: none; float:right; margin-left: 10px;">
                <span id="clearFilter" class="theme-btn1 text-center" style="height: 50px; display: inline-block; cursor: pointer;">{{ get_phrase('Reset') }}</span>
            </div>
            <a href="javascript:;" id="orderButton" class="theme-btn1 text-center mb-2 mt-4" disabled>
                {{ get_phrase('Order') }}
            </a>
        </div>
    </div>
</div>



<script>
    const currencySymbol = "{{ currency() }}";
    const listingCreatorId = "{{ $user_id }}";
  
    function updateOrderSummary() {
        let totalAmount = 0;
        let selectedItems = [];

        $('.shopItemCard').each(function () {
            let quantity = parseInt($(this).find('.quantity').text()) || 0;
            let product_id = parseInt($(this).find('.product-id').val()) || 0;
            let price = parseFloat($(this).find('.price').data('price')) || 0;
            let itemName = $(this).find('.fTitile h4').text();
            let image = $(this).find('figure img').attr('src');

            if (quantity > 0) {
                let itemTotal = quantity * price;
                totalAmount += itemTotal;

                selectedItems.push({
                    name: itemName,
                    product_id: product_id,
                    price: price,
                    quantity: quantity,
                    image: image,
                    total: itemTotal
                });
            }
        });

        sessionStorage.setItem('selectedItems', JSON.stringify(selectedItems));
    }

    function updateOrderButton() {
        let totalAmount = 0;
        let isItemSelected = false;

        $('.shopItemCard').each(function () {
            let quantity = parseInt($(this).find('.quantity').text()) || 0;
            let price = parseFloat($(this).find('.price').data('price')) || 0;

            if (quantity > 0) {
                totalAmount += quantity * price;
                isItemSelected = true;
            }
        });

        let $button = $('#orderButton');

        if (isItemSelected && totalAmount > 0) {
            $button.text(`{{ get_phrase('Confirm Order') }} (${currencySymbol}${totalAmount.toFixed(2)})`);
            $button.prop('disabled', false);
        } else {
            $button.text(`{{ get_phrase('Order') }}`);
            $button.prop('disabled', true);
        }
    }

    $(document).on('click', '.quantity-btn', function () {
        let $quantityElement = $(this).closest('.quantity-selector').find('.quantity');
        let quantity = parseInt($quantityElement.text());

        if ($(this).hasClass('plus')) {
            quantity += 1;
        } else if ($(this).hasClass('minus') && quantity > 0) {
            quantity -= 1;
        }

        $quantityElement.text(quantity);
        updateOrderSummary();
        updateOrderButton();
    });

  
  $(document).on('click', '#orderButton', function () {
    let isUserLoggedIn = false;
    @if(Auth::check()) isUserLoggedIn = true; @endif

    if (!isUserLoggedIn) {
        warning("{{ get_phrase('Please login first!') }}");
        return;
    }

    let isItemSelected = false;
    $('.shopItemCard').each(function () {
        let quantity = parseInt($(this).find('.quantity').text()) || 0;
        if (quantity > 0) {
            isItemSelected = true;
            return false;
        }
    });

    if (!isItemSelected) {
        warning("{{ get_phrase('Please select at least one product and quantity!') }}");
        return;
    }

    // Modal open karo
    edit_modal(
        'modal-lg',
        '{{ route('shopDetails', ['type' => $listing->type, 'id' => $listing->id]) }}',
        '{{ get_phrase('Order Confirmation') }}'
    );

    // 🔑 Modal open hone ke baad hidden field set karo
    setTimeout(function () {
        $('#listing_creator_id').val(listingCreatorId);
    }, 500);
});

</script>