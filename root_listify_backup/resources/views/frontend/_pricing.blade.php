@extends('layouts.frontend')
@section('title', get_phrase('pricing'))
@section('frontend_layout')
@php
    $subscription = App\Models\Subscription::where('user_id', user('id'))->orderBy('id','DESC')->first();
@endphp
<!-- Start Pricing Area -->
<section class="mt-5 d-none">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="in-title-3 mb-32 mt-2 text-center">{{get_phrase('Pricing Plan for Becoming Agent')}}</h1>
            </div>
        </div>
        <div class="row row-28 mb-90 justify-content-center">
            @foreach ($packages as $key => $package)  

            <div class="col-lg-4 col-md-6">
               <div @class(['at-shadow-card','eShadow','active' => $package->choice == 1,'activate_package' => isset($subscription->package_id) && $subscription->package_id == $package->id])">

                    <div class="d-flex flex-column h-100 justify-content-between">
                        <div>
                            <div class="sml-radio-iconbox mb-3">
                                <i class="{{$package->icon}} fs-30px icon-color"></i>
                            </div>
                            <h4 class="in-title-4 mb-1 {{$package->choice == 1?'text-white':''}}">{{$package->name}}</h4>
                            <p class="in-subtitle-1 fw-medium mb-2 {{$package->choice == 1?'text-white':''}}">{{$package->sub_title}}</p>
                          

                              <div class="d-flex align-items-center pb-3 mb-3 at-border-bottom">
                                  @if(!empty($package->price) && (int)$package->price > 0)
                                      <h1 class="in-title-1 {{ $package->choice == 1 ? 'text-white' : '' }}">
                                          {{ currency($package->price) }}
                                      </h1>
                                      <p class="in-subtitle-1 fw-medium {{ $package->choice == 1 ? 'text-white' : '' }}">
                                          / {{ ucwords($package->period) }}
                                      </p>
                                  @else
                                      <h1 class="in-title-1 {{ $package->choice == 1 ? 'text-white' : '' }}">
                                          {{ get_phrase('Free') }}
                                      </h1>
                                      <p class="in-subtitle-1 fw-medium {{ $package->choice == 1 ? 'text-white' : '' }}">
                                          / {{ ucwords($package->period) }}
                                      </p>
                                  @endif
                              </div>
                            
                           @if (isset($subscription->package_id) && $subscription->package_id == $package->id)
                            <div class="verified_package">
                              <img src="https://www.listify.asia/public/image/verified.png" alt="verified-icon" class="w-50"> 
                            </div>
                          @endif
                          

                            <ul class="d-flex flex-column gap-12px mb-4">
                                <li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{get_phrase('Listing Feature').' '.ucwords($package->feature)}} </li>
                                <li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->listing.' '.get_phrase('Directory Listings')}} </li>
                                <li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->category}} Categories Per Listings </li>
                                @if(!empty($package->contact) && strtolower($package->contact) != 'unavailable' && strtolower($package->contact) != 'y')
                                <li class="at-check-listitem {{ $package->choice == 1 ? 'text-white' : '' }}">{{ ucwords($package->contact).' '.get_phrase('Contact Form') }}</li>
                                @endif
                                @if(!empty($package->video) && strtolower($package->video) != 'unavailable' && strtolower($package->video) != 'y')
                                <li class="at-check-listitem {{ $package->choice == 1 ? 'text-white' : '' }}">{{ ucwords($package->video).' '.get_phrase('Listing Video') }}</li>
                                @endif
                                @if(!empty($package->Shop_feature))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->Shop_feature}} </li>@endif
                                @if(!empty($package->order_manage))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->order_manage}} </li>@endif
                                @if(!empty($package->c_whats))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->c_whats}} </li>@endif
                                @if(!empty($package->crm))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->crm}} </li>@endif
                                @if(!empty($package->chatbot))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->chatbot}} </li>@endif
                                @if(!empty($package->oneyerseo))<li class="at-check-listitem {{$package->choice == 1 ? 'text-white' : ''}}">{{ $package->oneyerseo }}</li>@endif
                            </ul>
                        </div>
                        @if (isset($subscription->package_id) && $subscription->package_id == $package->id)
                            <a href="javascript:void(0)" class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">{{get_phrase('Activated')}}</a>
                        @else
                            <a href="{{route('payment',['id'=>$package->id])}}" class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">{{get_phrase('Try Now')}}</a>
                        @endif
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!-- End Pricing Area -->

<style>
.pricing-toggle {
    position: relative;
    display: inline-flex;
    background: #f1f3f7;
    border-radius: 50px;
    padding: 5px;
    gap: 5px;
}

.toggle-btn {
    position: relative;
    z-index: 2;
    border: none;
    background: transparent;
    padding: 8px 22px;
    border-radius: 50px;
    font-weight: 500;
    color: #555;
    transition: 0.3s ease;
}

.toggle-btn.active {
    color: #fff;
}

.toggle-bg {
    position: absolute;
    top: 5px;
    left: 5px;
    height: calc(100% - 10px);
    width: 50%;
    background: linear-gradient(135deg, #6a5cff, #8f6fff);
    border-radius: 50px;
    transition: 0.3s ease;
}
</style>

<!-- Start Pricing Area -->
<section class="mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="in-title-3 mb-32 mt-2 text-center">
                    {{get_phrase('Pricing Plan for Becoming Agent')}}
                </h1>
            </div>
        </div>

        <!-- 🔹 Tabs -->
       <div class="pricing-toggle-wrapper text-center mb-4">
    <div class="pricing-toggle">
        <button class="toggle-btn active" data-type="monthly">Monthly</button>
        <button class="toggle-btn" data-type="annually">Annually</button>
        <div class="toggle-bg"></div>
    </div>
</div>

        <div class="row row-28 mb-90 justify-content-center">
            @foreach ($packages as $key => $package)

            <!-- ✅ yaha change kiya -->
            <div class="col-lg-4 col-md-6 package-item"
                 data-period="{{ strtolower($package->period ?? 'free') }}">

                <div @class([
                    'at-shadow-card',
                    'eShadow',
                    'active' => $package->choice == 1,
                    'activate_package' => isset($subscription->package_id) && $subscription->package_id == $package->id
                ])>

                    <div class="d-flex flex-column h-100 justify-content-between">
                        <div>
                            <div class="sml-radio-iconbox mb-3">
                                <i class="{{$package->icon}} fs-30px icon-color"></i>
                            </div>

                            <h4 class="in-title-4 mb-1 {{$package->choice == 1?'text-white':''}}">
                                {{$package->name}}
                            </h4>

                            <p class="in-subtitle-1 fw-medium mb-2 {{$package->choice == 1?'text-white':''}}">
                                {{$package->sub_title}}
                            </p>

                            <div class="d-flex align-items-center pb-3 mb-3 at-border-bottom">
                                @if(!empty($package->price) && (int)$package->price > 0)
                                    <h1 class="in-title-1 {{ $package->choice == 1 ? 'text-white' : '' }}">
                                        {{ currency($package->price) }}
                                    </h1>
                                    <p class="in-subtitle-1 fw-medium {{ $package->choice == 1 ? 'text-white' : '' }}">
                                        / {{ ucwords($package->period) }}
                                    </p>
                                @else
                                    <h1 class="in-title-1 {{ $package->choice == 1 ? 'text-white' : '' }}">
                                        {{ get_phrase('Free') }}
                                    </h1>
                                    <p class="in-subtitle-1 fw-medium {{ $package->choice == 1 ? 'text-white' : '' }}">
                                        / Free
                                    </p>
                                @endif
                            </div>


                            <ul class="d-flex flex-column gap-12px mb-4">
                                <li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{get_phrase('Listing Feature').' '.ucwords($package->feature)}} </li>
                                <li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->listing.' '.get_phrase('Directory Listings')}} </li>
                                <li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->category}} Categories Per Listings </li>
                                @if(!empty($package->contact) && strtolower($package->contact) != 'unavailable' && strtolower($package->contact) != 'y')
                                <li class="at-check-listitem {{ $package->choice == 1 ? 'text-white' : '' }}">{{ ucwords($package->contact).' '.get_phrase('Contact Form') }}</li>
                                @endif
                                @if(!empty($package->video) && strtolower($package->video) != 'unavailable' && strtolower($package->video) != 'y')
                                <li class="at-check-listitem {{ $package->choice == 1 ? 'text-white' : '' }}">{{ ucwords($package->video).' '.get_phrase('Listing Video') }}</li>
                                @endif
                                @if(!empty($package->Shop_feature))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->Shop_feature}} </li>@endif
                                @if(!empty($package->order_manage))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->order_manage}} </li>@endif
                                @if(!empty($package->c_whats))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->c_whats}} </li>@endif
                                @if(!empty($package->crm))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->crm}} </li>@endif
                                @if(!empty($package->chatbot))<li class="at-check-listitem {{$package->choice == 1?'text-white':''}}"> {{$package->chatbot}} </li>@endif
                                @if(!empty($package->oneyerseo))<li class="at-check-listitem {{$package->choice == 1 ? 'text-white' : ''}}">{{ $package->oneyerseo }}</li>@endif
                            </ul>
                        </div>

                        <a href="{{route('payment',['id'=>$package->id])}}"
                           class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">
                            {{get_phrase('Try Now')}}
                        </a>

                    </div>
                </div>
            </div>

            @endforeach
        </div>
    </div>
</section>

<!-- ✅ JS add karo -->
<script>
document.addEventListener("DOMContentLoaded", function () {

    const tabs = document.querySelectorAll(".toggle-btn");
    const packages = document.querySelectorAll(".package-item");
    const bg = document.querySelector(".toggle-bg");

    function filterPackages(type) {
        packages.forEach(pkg => {
            let period = pkg.getAttribute("data-period");

            if (period === type || period === "free") {
                pkg.style.display = "block";
            } else {
                pkg.style.display = "none";
            }
        });
    }

    // Default load → Monthly
    filterPackages("monthly");

    tabs.forEach((tab, index) => {
        tab.addEventListener("click", function () {

            // active button
            tabs.forEach(t => t.classList.remove("active"));
            this.classList.add("active");

            // background slide
            bg.style.transform = index === 0 ? "translateX(0%)" : "translateX(100%)";

            let type = this.getAttribute("data-type");
            filterPackages(type);
        });
    });

});
</script>

<!-- Start QNA Area -->
<section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <h1 class="in-title-3 mb-32 text-center">{{get_phrase('Frequently Asked Questions')}}</h1>
        </div>
        <div class="col-12 mb-90">
            <div class="accordion at-accordion" id="faqAccordion">
                @php
                    $faqs = count(json_decode(get_frontend_settings('website_faqs'), true)) > 0 
                        ? json_decode(get_frontend_settings('website_faqs'), true) 
                        : [['question' => '', 'answer' => '']];
                @endphp
                @foreach ($faqs as $index => $faq)
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading{{ $index }}">
                        <button 
                            class="accordion-button {{ $index > 0 ? 'collapsed' : '' }}" 
                            type="button" 
                            data-bs-toggle="collapse" 
                            data-bs-target="#collapse{{ $index }}" 
                            aria-expanded="{{ $index === 0 ? 'true' : 'false' }}" 
                            aria-controls="collapse{{ $index }}">
                            {{ $faq['question'] }}
                        </button>
                    </h2>
                    <div 
                        id="collapse{{ $index }}" 
                        class="accordion-collapse collapse {{ $index === 0 ? 'show' : '' }}" 
                        aria-labelledby="heading{{ $index }}" 
                        data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            <p>{{ $faq['answer'] }}</p>
                        </div>
                    </div>
                </div>
            @endforeach

                
            </div>
        </div>
    </div>
</div>
</section>
<!-- End QNA Area -->

@endsection