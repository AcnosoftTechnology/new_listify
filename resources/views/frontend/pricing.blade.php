@extends('layouts.frontend')
@section('title', get_phrase('pricing'))
@section('frontend_layout')
@php
    $subscription = App\Models\Subscription::where('user_id', user('id'))->orderBy('id','DESC')->first();
@endphp
@php
    $yearlyPackage = collect($packages)->firstWhere('price', 5000);
@endphp

<section class="mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="in-title-3 mb-32 mt-2 text-center">
                    {{get_phrase('Pricing Plan for Becoming Agent')}}
                </h1>
            </div>
        </div>

        <div class="row row-28 mb-90 justify-content-center">

            @foreach ($packages as $key => $package)

                @if($package->price == 5000)
                    @continue
                @endif

                <div class="col-lg-4 col-md-6">
                    <div @class([
                        'at-shadow-card','eShadow',
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

                                {{-- ✅ Toggle only for 500 plan --}}
                                @if($package->price == 500)
                                <div class="pricing-toggle mb-3 text-center">
                                    <button type="button" class="toggle-btn active" onclick="switchPlan('monthly')">Monthly</button>
                                    <button type="button" class="toggle-btn" onclick="switchPlan('yearly')">Yearly</button>
                                </div>
                                @endif

                                {{-- ✅ Dynamic Price --}}
                                <div class="d-flex align-items-center pb-3 mb-3 at-border-bottom">

                                    @if($package->price == 500)

                                        <h1 class="in-title-1 {{$package->choice == 1 ? 'text-white' : ''}}">
                                            <span class="price-amount">₹500</span>
                                        </h1>

                                        <p class="in-subtitle-1 fw-medium {{$package->choice == 1 ? 'text-white' : ''}}">
                                            / <span class="price-period">Monthly</span>
                                        </p>

                                    @elseif(!empty($package->price) && (int)$package->price > 0)

                                        <h1 class="in-title-1 {{$package->choice == 1 ? 'text-white' : ''}}">
                                            {{ currency($package->price) }}
                                        </h1>

                                        <p class="in-subtitle-1 fw-medium {{$package->choice == 1 ? 'text-white' : ''}}">
                                            / {{ ucwords($package->period) }}
                                        </p>

                                    @else

                                        <h1 class="in-title-1 {{$package->choice == 1 ? 'text-white' : ''}}">
                                            {{ get_phrase('Free') }}
                                        </h1>

                                        <p class="in-subtitle-1 fw-medium {{$package->choice == 1 ? 'text-white' : ''}}">
                                            / {{ ucwords($package->period) }}
                                        </p>

                                    @endif
                                </div>

                                {{-- verified --}}
                                @if (isset($subscription->package_id) && $subscription->package_id == $package->id)
                                <div class="verified_package">
                                    <img src="https://www.listify.asia/public/image/verified.png" class="w-50">
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

                            {{-- ✅ Button --}}
                                @if($package->price == 500)

                                @php
                                    $currentPackage = $subscription->package_id ?? 0;
                                @endphp

                                <a id="planBtn"
                                data-package-id="12"
                                data-current="{{ $currentPackage }}"
                                href="{{ ($currentPackage == 12) ? 'javascript:void(0)' : route('payment',['id'=>12]) }}"
                                class="{{$package->choice == 1 ? 'btn at-btn-white' : 'theme-btn1'}} w-100 text-center">

                                    @if(!$subscription)
                                        Try Now
                                    @elseif($currentPackage == 12)
                                        Activated
                                    @else
                                        Upgrade Plan
                                    @endif

                                </a>

                                @elseif (isset($subscription->package_id) && $subscription->package_id == $package->id)

                                <a href="javascript:void(0)"
                                class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">
                                Activated
                                </a>

                                @else

                                <a href="{{route('payment',['id'=>$package->id])}}"
                                class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">
                                Upgrade Plan
                                </a>

                                @endif

                        </div>
                    </div>
                </div>

            @endforeach

        </div>
    </div>
</section>

{{-- ✅ JS --}}
<script>

    const paymentUrl = "{{ route('payment', ['id' => ':id']) }}";

    function switchPlan(type){

    const price=document.querySelector('.price-amount');
    const period=document.querySelector('.price-period');
    const btn=document.getElementById('planBtn');
    const buttons=document.querySelectorAll('.toggle-btn');

    buttons.forEach(b=>b.classList.remove('active'));

    const currentPackage=btn.dataset.current;

    if(type==='monthly'){

        price.innerText='₹500';
        period.innerText='Monthly';

        btn.dataset.packageId='12';

        buttons[0].classList.add('active');

        if(currentPackage=='12'){

            btn.innerHTML='Activated';
            btn.href='javascript:void(0)';

        }else if(currentPackage=='17'){

            btn.innerHTML='Upgrade Plan';
            btn.href=paymentUrl.replace(':id','12');

        }else{

            btn.innerHTML='Try Now';
            btn.href=paymentUrl.replace(':id','12');

        }

    }else{

        price.innerText='₹5000';
        period.innerText='Annually';

        btn.dataset.packageId='17';

        buttons[1].classList.add('active');

        if(currentPackage=='17'){

            btn.innerHTML='Activated';
            btn.href='javascript:void(0)';

        }else if(currentPackage=='12'){

            btn.innerHTML='Upgrade Plan';
            btn.href=paymentUrl.replace(':id','17');

        }else{

            btn.innerHTML='Try Now';
            btn.href=paymentUrl.replace(':id','17');

        }

    }

    }

    const btn=document.getElementById('planBtn');

    if(btn){

    btn.addEventListener('click',function(e){

    if(this.innerText.trim()=='Activated'){
        e.preventDefault();
        return false;
    }

    this.href=paymentUrl.replace(':id',this.dataset.packageId);

    });

    }

</script>

{{-- ✅ CSS --}}
<style>
.pricing-toggle {
    display: inline-flex;
    background: #eee;
    border-radius: 50px;
    padding: 4px;
}
.toggle-btn {
    border: none;
    padding: 6px 16px;
    border-radius: 50px;
    background: transparent;
    cursor: pointer;
}
.toggle-btn.active {
    background: #6c2bd9;
    color: #fff;
}
</style>


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