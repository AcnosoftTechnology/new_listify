@extends('layouts.frontend')
@push('title', get_phrase('Subscription'))
@push('meta')@endpush
@section('frontend_layout')
    @php use Carbon\Carbon; @endphp
    @include('user.agent.subscription.style')
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
                            <h1 class="ca-title-18px">{{ get_phrase('Agent Subscription') }}</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb cap-breadcrumb">
                                    <li class="breadcrumb-item cap-breadcrumb-item"><a href="{{ route('home') }}">{{ get_phrase('Home') }}</a></li>
                                    <li class="breadcrumb-item cap-breadcrumb-item active" aria-current="page">{{ get_phrase('subscription') }}</li>
                                </ol>
                            </nav>
                        </div>
                        <button class="btn ca-menu-btn-primary d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#user-sidebar-offcanvas" aria-controls="user-sidebar-offcanvas">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21 5.25H3C2.59 5.25 2.25 4.91 2.25 4.5C2.25 4.09 2.59 3.75 3 3.75H21C21.41 3.75 21.75 4.09 21.75 4.5C21.75 4.91 21.41 5.25 21 5.25Z" fill="#242D47" />
                                <path d="M21 10.25H3C2.59 10.25 2.25 9.91 2.25 9.5C2.25 9.09 2.59 8.75 3 8.75H21C21.41 8.75 21.75 9.09 21.75 9.5C21.75 9.91 21.41 10.25 21 10.25Z" fill="#242D47" />
                                <path d="M21 15.25H3C2.59 15.25 2.25 14.91 2.25 14.5C2.25 14.09 2.59 13.75 3 13.75H21C21.41 13.75 21.75 14.09 21.75 14.5C21.75 14.91 21.41 15.25 21 15.25Z" fill="#242D47" />
                                <path d="M21 20.25H3C2.59 20.25 2.25 19.91 2.25 19.5C2.25 19.09 2.59 18.75 3 18.75H21C21.41 18.75 21.75 19.09 21.75 19.5C21.75 19.91 21.41 20.25 21 20.25Z" fill="#242D47" />
                            </svg>
                        </button>
                    </div>
                    <div class="dl_column_content d-flex flex-column rg-30">
                        @if ($expiry_status)
                            <div class="dl_column_item pt-22 px-30 pb-30 boxShadow-06 bg-white">
                                <div class="d-flex justify-content-between align-items-center flex-wrap pb-22 mb-30 bd-b-1">
                                    <!-- Title -->
                                    <div class="tableTitle-3">
                                        <h4 class="fz-20-sb-black pb-10">{{ get_phrase($current_package->name) . ' ' . get_phrase('Account') }}</h4>
                                        <p class="fz-15-r-gray">{{ get_phrase($current_package->sub_title) . ' - ' . ucwords(get_phrase($current_package->period)) . ' ' . get_phrase('plan') }}</p>
                                    </div>
                                    <!-- Button -->
                                </div>
                                <p class="fz-15-r-gray">
                                    {{ get_phrase('Your current package price is') }}

                                    <span class="fz-24-b-black">
                                        {{ currency($current_package->price) }}
                                    </span>.

                                    @if(!is_null($current_subscription->expire_date))
                                        @php
                                            $date = date('M d, Y, h:i a', $current_subscription->expire_date);
                                        @endphp

                                        {{ get_phrase('It will expire on') }} {{ $date }}
                                    @else
                                        <span class="badge bg-success">
                                            {{ get_phrase('Lifetime / Free Plan') }}
                                        </span>
                                    @endif
                                </p>
                            </div>
                        @else
                            <div class="dl_column_item pt-22 px-30 pb-30 boxShadow-06 bg-white">
                                <!-- Title -->
                                <div class="tableTitle-3 pb-20 mb-30 bd-b-1">
                                    <h4 class="fz-20-sb-black pb-10">{{ get_phrase('Expired Subscription') }}</h4>
                                </div>
                                <!-- Expired Content -->
                                <div class="subscription-expired px-30 py-30 bd-r-5">
                                    <h3 class="fz-18-sb-black pb-10">
                                        {{ get_phrase('Your subscription has expired') }}
                                    </h3>
                                    <p class="fz-15-r-gray pb-30">
                                        {{ get_phrase('Your package has expired, please renew your package') }}.
                                    </p>
                                    <a href="{{ route('customer.become_an_agent') }}" onclick="renew_subscription()" class="eBtn expired-btn">{{ get_phrase('Renew Subscription') }}</a>
                                </div>
                            </div>
                        @endif
                        <!-- Payment Method -->
                        <div class="dl_column_item pt-22 px-30 pb-30 boxShadow-06 bg-white">
                            <!-- Title -->
                            <div class="tableTitle-3 pb-22 mb-25 bd-b-1">
                                <h4 class="fz-20-sb-black">{{ get_phrase('Payment Method') }}</h4>
                            </div>
                            <!-- Card Info -->
                            <div class="card-info d-flex align-items-center g-8 mt-3">
                                <div class="icon text-black fz-15-r-gray">
                                    <i class="fas fa-credit-card me-2"></i>
                                </div>
                                <p class="fz-15-r-gray">{{ ucfirst($current_subscription->payment_method ?? '') }}</p>
                            </div>
                        </div>
                        <!-- Invoicing -->
                        <div class="dl_column_item pt-22 px-30 pb-30 boxShadow-06 bg-white">
                            <div class="d-flex justify-content-between align-items-center flex-wrap">
                                <!-- Title -->
                                <div class="tableTitle-3">
                                    <h4 class="fz-20-sb-black pb-10">{{ get_phrase('Invoicing') }}</h4>
                                    @php $last_payment_date = date('d-m-Y', strtotime($current_subscription->created_at ?? date('d-m-Y'))); @endphp
                                    <p class="fz-15-r-gray">{{ get_phrase('Last payment:') . ' ' }}{{ $last_payment_date }}</p>
                                </div>
                                <!-- Button -->
                                <a href="{{ route('modifyBilling') }}" class="btn cap-btn-primary ">{{ get_phrase('Modify Billing Information') }}</a>
                            </div>
                        </div>
                        <!-- Billing History -->
                        <div class="dl_column_item pt-22 px-30 pb-30 boxShadow-06 bg-white">
                            <!-- Title -->
                            <div class="tableTitle-3">
                                <h4 class="fz-20-sb-black">{{ get_phrase('Billing History') }}</h4>
                            </div>
                            <!-- Table -->

                            <div class="table-responsive pb-1 mt-4">
                                <table class="table ca-table ca-table-width">
                                    <thead class="ca-thead">
                                        <tr class="ca-tr">
                                            <th scope="col" class="ca-title-14px ca-text-dark">{{ get_phrase('Package') }}</th>
                                            <th scope="col" class="ca-title-14px ca-text-dark">{{ get_phrase('Start Date') }}</th>
                                            <th scope="col" class="ca-title-14px ca-text-dark">{{ get_phrase('End Date') }}</th>
                                            <th scope="col" class="ca-title-14px ca-text-dark">{{ get_phrase('Amount') }}</th>
                                            <th scope="col" class="ca-title-14px ca-text-dark">{{ get_phrase('Status') }}</th>
                                            <th scope="col" class="ca-title-14px ca-text-dark text-center">{{ get_phrase('Download') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody class="ca-tbody">
    @foreach ($all_subscription as $row)

        @php
            $created_at = date('d M Y', strtotime($row->created_at));

            $expire_date = $row->expire_date
                ? date('d M Y', $row->expire_date)
                : 'Lifetime';

            $package = App\Models\Pricing::find($row->package_id);
        @endphp

        <tr class="ca-tr">

            <td class="min-w-110px">
                <p class="ca-subtitle-14px ca-text-dark text-nowrap">
                    {{ $package ? $package->name : 'Package Not Found' }}
                </p>
            </td>

            <td class="min-w-110px">
                <p class="ca-subtitle-14px ca-text-dark mb-2">
                    {{ $created_at }}
                </p>
            </td>

            <td class="min-w-110px">
                <p class="ca-subtitle-14px ca-text-dark text-nowrap mb-2">
                    {{ $expire_date }}
                </p>
            </td>

            <td>
                <p class="ca-subtitle-14px ca-text-dark text-nowrap mb-2">
                    {{ currency($row->paid_amount) }}
                </p>
            </td>

            <td>
                @if ($row->status == 1)
                    <span class="badge bg-success">
                        <i class="fas fa-check"></i> Active
                    </span>

                @elseif($row->status == 0)
                    <span class="badge bg-danger">
                        <i class="fas fa-times"></i> Inactive
                    </span>

                @elseif($row->status == 2)
                    <span class="badge bg-warning text-dark">
                        <i class="fas fa-clock"></i> Expired
                    </span>

                @else
                    <span class="badge bg-secondary">
                        Unknown
                    </span>
                @endif
            </td>

            <td>
                <div class="tDownloadIcon">
                    <a class="invoiceTag"
                       href="{{ route('subscriptionInvoice', ['id' => $row->id]) }}"
                       target="_blank">

                        <!-- Your SVG here -->

                    </a>
                </div>
            </td>

        </tr>

    @endforeach
</tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
@endsection
