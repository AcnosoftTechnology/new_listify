@extends('layouts.frontend')
@push('title', get_phrase('Edit Invoice'))
@push('meta')@endpush
@section('frontend_layout')

<section class="ca-wraper-main mb-90px mt-4">
    <div class="container">
        <div class="row gx-20px">
            <!-- Left Sidebar -->
            <div class="col-lg-4 col-xl-3">
                @include('user.navigation')
            </div>

            <!-- Right Content -->
            <div class="col-lg-8 col-xl-9">
                <!-- Header -->
                <div class="d-flex align-items-start justify-content-between gap-2 mb-20px">
                    <div class="d-flex justify-content-between align-items-start gap-12px flex-column flex-lg-row w-100">
                        <h1 class="in-title-16px">{{ get_phrase('Edit Invoice') }}</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb cap-breadcrumb">
                                <li class="breadcrumb-item cap-breadcrumb-item"><a href="{{route('home')}}">{{get_phrase('Home')}}</a></li>
                                <li class="breadcrumb-item cap-breadcrumb-item"><a href="{{route('customer.invoice')}}">{{get_phrase('Invoice')}}</a></li>
                                <li class="breadcrumb-item cap-breadcrumb-item active" aria-current="page">{{get_phrase('Edit')}}</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Form -->
                <div class="ca-content-card p-3">
                    <form action="{{ route('customer.invoice.update', $invoice->id) }}" method="POST" class="invoice-form">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">{{ get_phrase('Note') }}</label>
                            <textarea name="note" class="form-control">{{ $invoice->note }}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ get_phrase('Terms & Condition') }}</label>
                            <textarea name="terms_condition" class="form-control">{{ $invoice->terms_condition }}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ get_phrase('Shipping') }}</label>
                            <textarea name="shipping" class="form-control">{{ $invoice->shipping }}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ get_phrase('Disclaimer') }}</label>
                            <textarea name="disclaimer" class="form-control">{{ $invoice->disclaimer }}</textarea>
                        </div>
                        <button type="submit" class="btn ca-menu-btn-primary">{{ get_phrase('Update') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
