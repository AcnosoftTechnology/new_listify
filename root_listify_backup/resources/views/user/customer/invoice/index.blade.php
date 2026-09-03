@extends('layouts.frontend')
@push('title', get_phrase('Invoice'))
@section('frontend_layout')

<section class="ca-wraper-main mb-90px mt-4">
    <div class="container">
        <div class="row gx-20px">
            <div class="col-lg-4 col-xl-3">
                @include('user.navigation')
            </div>
            <div class="col-lg-8 col-xl-9">
                <div class="d-flex justify-content-between align-items-center mb-20px">
                    <h1 class="in-title-16px">{{ get_phrase('Invoice') }}</h1>

                    @if(!$invoice)
                        <a href="{{ route('customer.invoice.create') }}" class="btn btn-primary">
                            {{ get_phrase('Add Invoice') }}
                        </a>
                    @else
                        <a href="{{ route('customer.invoice.edit', $invoice->id) }}" class="btn btn-info">
                            {{ get_phrase('Edit Invoice') }}
                        </a>
                    @endif
                </div>

                <div class="ca-content-card invoice_list p-3">
                    @if($invoice)
                        <p><strong>Note:</strong> {{ $invoice->note }}</p>
                        <p><strong>Terms & Condition:</strong> {{ $invoice->terms_condition }}</p>
                        <p><strong>Shipping:</strong> {{ $invoice->shipping }}</p>
                        <p><strong>Disclaimer:</strong> {{ $invoice->disclaimer }}</p>
                    @else
                        <p class="text-muted">{{ get_phrase('No invoice found. Please create one.') }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
