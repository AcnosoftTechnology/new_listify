@extends('layouts.frontend')
@push('title', get_phrase('Become an agent'))
@push('meta')@endpush
@section('frontend_layout')
<link rel="stylesheet" href="{{asset('assets/frontend/css/all.min.css')}}">
@php
    $subscription = App\Models\Subscription::where('user_id', user('id'))->orderBy('id','DESC')->first();
@endphp
<style>
    .fs-14px{
        font-size: 14px;
    }
    .icon-color {
        color: #6C1CFF;
    }
    .fs-30px {
        font-size: 30px;
    }
    .ad-pricing-card:hover li {
        color: #fff;
    }
</style>

    <!-- Start Main Area -->
    <section class="ca-wraper-main mb-90px mt-4">
        <div class="container">
            <div class="row gx-20px">
                <div class="col-lg-4 col-xl-3">
                    @include('user.navigation')
                </div>
                <div class="col-lg-8 col-xl-9">
                    <!-- Header -->
                    <div class="d-flex align-items-start justify-content-between gap-2 mb-20px">
                        <div class="d-flex justify-content-between align-items-start gap-12px flex-column flex-lg-row w-100">
                            <h1 class="in-title-16px">{{get_phrase('Become An Agent')}}</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb cap-breadcrumb">
                                  <li class="breadcrumb-item cap-breadcrumb-item"><a href="{{route('home')}}">{{get_phrase('Home')}}</a></li>
                                  <li class="breadcrumb-item cap-breadcrumb-item active" aria-current="page">{{get_phrase('Become An Agent')}}</li>
                                </ol>
                            </nav>
                        </div>
                        <button class="btn ca-menu-btn-primary d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#user-sidebar-offcanvas" aria-controls="user-sidebar-offcanvas">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21 5.25H3C2.59 5.25 2.25 4.91 2.25 4.5C2.25 4.09 2.59 3.75 3 3.75H21C21.41 3.75 21.75 4.09 21.75 4.5C21.75 4.91 21.41 5.25 21 5.25Z" fill="#242D47"/>
                                <path d="M21 10.25H3C2.59 10.25 2.25 9.91 2.25 9.5C2.25 9.09 2.59 8.75 3 8.75H21C21.41 8.75 21.75 9.09 21.75 9.5C21.75 9.91 21.41 10.25 21 10.25Z" fill="#242D47"/>
                                <path d="M21 15.25H3C2.59 15.25 2.25 14.91 2.25 14.5C2.25 14.09 2.59 13.75 3 13.75H21C21.41 13.75 21.75 14.09 21.75 14.5C21.75 14.91 21.41 15.25 21 15.25Z" fill="#242D47"/>
                                <path d="M21 20.25H3C2.59 20.25 2.25 19.91 2.25 19.5C2.25 19.09 2.59 18.75 3 18.75H21C21.41 18.75 21.75 19.09 21.75 19.5C21.75 19.91 21.41 20.25 21 20.25Z" fill="#242D47"/>
                            </svg>
                        </button>
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

                                <a id="planBtn" data-package-id="12" href="{{ route('payment', ['id' => 12]) }}" class="{{$package->choice == 1 ? 'btn at-btn-white' : 'theme-btn1'}} w-100 text-center">
                                   Try Now
                                </a>

                            @elseif (isset($subscription->package_id) && $subscription->package_id == $package->id)

                                <a href="javascript:void(0)"
                                   class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">
                                   Activated
                                </a>

                            @else

                                <a href="{{route('payment',['id'=>$package->id])}}"
                                   class="{{$package->choice == 1?'btn at-btn-white':'theme-btn1'}} w-100 text-center">
                                   Try Now
                                </a>

                            @endif

                        </div>
                    </div>
                </div>

            @endforeach

        </div>
                  
                  
                </div>
            </div>
        </div>
    </section>

<script>
    const paymentUrl = "{{ route('payment', ['id' => ':id']) }}";

    function switchPlan(type) {
        const price = document.querySelector('.price-amount');
        const period = document.querySelector('.price-period');
        const btn = document.getElementById('planBtn');
        const buttons = document.querySelectorAll('.toggle-btn');

        buttons.forEach(button => button.classList.remove('active'));

        if (type === 'monthly') {
            price.innerText = '₹500';
            period.innerText = 'Monthly';
            btn.dataset.packageId = '12';

            buttons[0].classList.add('active');
        } else {
            price.innerText = '₹5000';
            period.innerText = 'Annually';
            btn.dataset.packageId = '17';

            buttons[1].classList.add('active');
        }

        // Toggle hote hi href bhi update hoga
        btn.href = paymentUrl.replace(':id', btn.dataset.packageId);
    }

    // Try Now click par selected package ID ka URL forcefully set hoga
    document.getElementById('planBtn').addEventListener('click', function () {
        this.href = paymentUrl.replace(':id', this.dataset.packageId);
    });
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

@endsection