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
  .product-card.active {
    border: 2px solid #6c1cff;
    border-radius: 8px;
}
  
  .discp_tab.active{
   color: #6c1cff!important;
  }
  .discp_tab{
    font-family: 'Inter';
    font-size: 20px;
    font-style: normal;
    font-weight: 600;
    line-height: 24px;
    color:#000;
  }
  .feature_card{
    border: 1px solid #6c1cff;
    padding: 10px;
    text-align: center;
    border-radius: 10px;
  }
  .feature_icon i{
    font-size: 20px;
    color: #6c1cff;
    background-color: #ededed;
    padding: 15px;
    border-radius: 50px;
  }
  .feature_text h4{
    line-height: 23px;
    font-size: 16px;
    color: #000;
    font-weight: 500;
  }
  .accordion-button{
    font-family: 'Inter';
    font-size: 18px;
    font-style: normal;
    font-weight: 600;
    line-height: 24px;
    color:#000;
  }
  .accordion-body{
    color:#706c6c;
    font-family: 'Inter';
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: 24px;
  }
  .accordion-button:focus {
    box-shadow:none!important;
}
  .hotel-amenities-area {
    box-shadow: 0 4px 40px 0 rgba(0, 0, 0, 0.1);
    background: var(--whiteColor);
    border-radius: 12px;
    padding: 24px;
  }
  
  .abhishek_cat_tab{
       background-color: #fff;
       width: 100%;
       white-space: nowrap;
       scrollbar-width: thin !important;
       overflow: scroll;
       flex-wrap: nowrap !important;
       padding-bottom: 10px;
       overflow-y: hidden;
  }

</style>
<script src="{{ asset('assets/frontend/js/mixitup.min.js') }}"></script>
<div class="at-details-description shopdescription mb-50px mt-5">
    <h4 class="title mb-16">{{ get_phrase('Shop products') }}</h4>

    <div class="row mb-4 mt-4">
        <div class="col-12">
            <div class="d-flex gap-14px flex-wrap abhishek_cat_tab">
                <button type="button" data-filter="all" class="btn car-filter-btn mixitup-control-active">{{ get_phrase('All') }}</button>
              
              @foreach ($shopCategories as $category)
                    <button type="button" data-filter=".{{ 'category-' . $category->id }}" class="btn car-filter-btn">
                        {{ $category->name }}
                    </button>
                @endforeach
            </div>
        </div>
    </div>

<div class="row mixitup g-2" id="shopItemsContainer">
    @foreach($shopItems as $index => $shop)
        <div class="col-lg-6 col-md-6 shopItemCard mix {{ 'category-' . $shop->category_id }}">
            <div class="shopCard product-card {{ $index == 0 ? 'active' : '' }}" 
                 data-id="{{ $shop->id }}"
                 data-name="{{ $shop->name }}"
                 data-description="{{ $shop->description }}"
                 data-additional="{{ $shop->additional_info }}"
                 data-icons='@json(json_decode($shop->icon_data, true))'>
                 
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

                    <p class="mb-2 name">{{ Str::limit($shop->description, 60) }}</p>
                    
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

                        <!-- ✅ Quantity Selector -->
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

  
  
<!-- ✅ Tabs Section -->
<div class="product-details-tabs restdetails-agent-details my-5">
    <ul class="nav nav-tabs" id="productTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link discp_tab active" id="desc-tab" data-bs-toggle="tab" data-bs-target="#desc" type="button" role="tab">
                Description
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link discp_tab" id="add-info-tab" data-bs-toggle="tab" data-bs-target="#add-info" type="button" role="tab">
                Additional Information
            </button>
        </li>
    </ul>

    <div class="tab-content p-3 border border-top-0" id="productTabContent">
        <div class="tab-pane fade show active" id="desc" role="tabpanel">
            <p id="product-description" style="text-align: justify;">No details here</p>
        </div>
        <div class="tab-pane fade" id="add-info" role="tabpanel">
            <p id="product-additional" style="text-align: justify;">No details here</p>
        </div>
    </div>
  
  <!-- ✅ Special Features (Dynamic) -->
<div class="special_feature mt-4">
    <div class="row" id="special-feature-wrapper">
        <!-- JS se fill hoga -->
    </div>
</div>
  
  
</div> 
  

  
 <!-- ✅ Order Button Section -->
<div class="orderBtn d-flex justify-content-center">
    <div>
        <div id="clearFilterWrapper" style="display: none; float:right; margin-left: 10px;">
            <span id="clearFilter" class="theme-btn1 text-center" style="height: 50px; display: inline-block; cursor: pointer;">
                {{ get_phrase('Reset') }}
            </span>
        </div>
        <a href="javascript:;" id="orderButton" class="theme-btn1 new_order_tab text-center" disabled>
            {{ get_phrase('Order') }}
        </a>
    </div>
</div> 

  
</div>  

<script>
document.addEventListener("DOMContentLoaded", function () {
    let cards = document.querySelectorAll(".product-card");
    let descEl = document.getElementById("product-description");
    let addInfoEl = document.getElementById("product-additional");
    let featureWrapper = document.getElementById("special-feature-wrapper");

  
    function renderFeatures(icons) {
        featureWrapper.innerHTML = ""; 
        if (icons && icons.length > 0) {
            icons.forEach(icon => {
                let col = document.createElement("div");
                col.className = "col-lg-3 col-md-4 col-sm-4 col-6 my-2";
                col.innerHTML = `
                    <div class="feature_card">
                        <div class="feature_icon my-2">
                            <i class="${icon.icon}"></i>
                        </div>
                        <div class="feature_text my-2">
                            <h4>${icon.title}</h4>
                        </div>
                    </div>
                `;
                featureWrapper.appendChild(col);
            });
        } else {
            featureWrapper.innerHTML = ``;
        }
    }


    function setActiveProduct(card, scroll = true) {
        cards.forEach(c => c.classList.remove("active"));
        card.classList.add("active");

        let desc = card.dataset.description?.trim() || "No details here";
        let addInfo = card.dataset.additional?.trim() || "No details here";
        let icons = [];
        try {
            icons = JSON.parse(card.dataset.icons || "[]");
        } catch (e) { icons = []; }

        descEl.innerText = desc;
        addInfoEl.innerText = addInfo;
        renderFeatures(icons);

        if (scroll) {
            document.querySelector(".product-details-tabs").scrollIntoView({ behavior: "smooth" });
        }
    }

 
    if(cards.length > 0){
        setActiveProduct(cards[0], false);
    }


    cards.forEach(card => {
        card.addEventListener("click", function (e) {
            if (e.target.closest(".quantity-selector")) return;
            setActiveProduct(this, true);
        });
    });
});
</script>



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

    setTimeout(function () {
        $('#listing_creator_id').val(listingCreatorId);
    }, 500);
});




</script>
