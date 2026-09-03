@extends('layouts.frontend')
@push('title', get_phrase('My Order'))
@push('meta')@endpush
@section('frontend_layout')

<style>
   .object {
	position: relative;
	padding-left: 10px;
}
    .object::after {
	position: absolute;
	content: "";
	top: 43%;
	left: 0;
	width: 5px;
	height: 5px;
	background: #000;
	border-radius: 50%;
}
.eMessage p {
	line-height: 23px;
	font-size: 13px;
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
                        <h1 class="ca-title-18px">{{get_phrase('My Orders')}}</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb cap-breadcrumb">
                                <li class="breadcrumb-item cap-breadcrumb-item"><a href="{{route('home')}}">{{get_phrase('Home')}}</a></li>
                                <li class="breadcrumb-item cap-breadcrumb-item active" aria-current="page">{{get_phrase('My Orders')}}</li>
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
                <div class="ca-content-card">
                    <div class="table-responsive pb-1">
                        <table class="table ca-table ca-table-width">
                            <thead class="ca-thead">
                              <tr class="ca-tr">
                                <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Id')}}</th>
                                <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Product Details')}}</th>
                                
                                <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Amount to Pay')}}</th>
                                <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Delivered Details')}}</th>
                                <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Date')}}</th>
                                <th scope="col" class="ca-title-14px ca-text-dark text-center">{{get_phrase('Action')}}</th>
                              </tr>
                            </thead>
                            <tbody class="ca-tbody" style="vertical-align: inherit;">
                                @php $num = 1 @endphp
                                @foreach ($myOrders as $key => $order)
                                @php
                                   $products = json_decode($order->product, true); 
                                @endphp
                                <tr class="ca-tr">
                                  <td>
                                     {{++$key}}
                                  </td>
                                  <td class="ca-subtitle-14px ca-text-dark min-w-110px">
                                    <p><b>{{get_phrase('Type : ')}}</b> <span class="capitalize">{{$order->type}}</span></p>
                                    @foreach ($products as $product)
                                    @php
                                        $inventory = \App\Models\Inventory::find($product['product_id']);
                                    @endphp
                                    @if($inventory)
                                        <p class="ca-subtitle-14px object ca-text-dark text-nowrap mb-1">
                                           {{ $inventory->name }} X {{$product['quantity']}} <br>
                                        </p>
                                      @endif
                                     @endforeach
                                    </td>
                                  <td> 
                                        <div class="ca-subtitle-14px ca-text-dark min-w-140px">
                                            <p>{{get_phrase('Amount Pay : ')}} {{currency($order->amount)}}</p>
                                              <p >{{get_phrase('Status : ')}}
                                            @if($order->payment_status == 'paid') 
                                                    <span class="badge bg-success">{{ get_phrase('Paid') }}</span> 
                                                @else 
                                                <span class="badge bg-danger">{{ get_phrase('Unpaid') }}</span>
                                            @endif
                                            </p>
                                        </div>
                                  </td>
                                  <td>
                                     <div class="min-w-140px ca-subtitle-14px ca-text-dark">
                                        <p>{{get_phrase('Contact : ')}} {{$order->customer_phone}}</p>
                                        <p>{{get_phrase('Address : ')}} {{$order->customer_address}}</p>
                                        <p>{{get_phrase('Status : ')}}
                                           @if($order->delivery_status == 'delivered') 
                                                <span class="badge bg-success">{{ get_phrase('Delivered') }}</span> 
                                            @else 
                                               <span class="badge bg-danger">{{ get_phrase('Not Delivered') }}</span>
                                           @endif
                                        </p>
                                        <div class="eMessage">
                                            <p class="ca-subtitle-14px ca-text-dark mb-6px mb-2">
                                                <span class="short-text">
                                                    {{ \Illuminate\Support\Str::words($order->customer_message, 60, '...') }}
                                                </span>
                                                <span class="full-text d-none">
                                                    {{ $order->customer_message }}
                                                </span>
                                                @if(str_word_count($order->customer_message) > 60)
                                                    <a href="javascript:void(0)" class="read-more">{{get_phrase('Read More')}}</a>
                                                @endif
                                            </p>
                                            
                                        </div>  
                                     </div>
                                  </td>
                                  <td >
                                        <div class="ca-subtitle-14px ca-text-dark text-nowrap min-w-110px">
                                            @if($order->delivery_status == 'delivered') 
                                            <p>{{ get_phrase('Delivered at  : ') }} {{ \Carbon\Carbon::parse($order->update_at)->format('D, d/M/Y') }}</p>
                                            @else
                                            <p>{{ get_phrase('Order placed at : ') }} {{ \Carbon\Carbon::parse($order->created_at)->format('D, d/M/Y') }}</p>
                                            @endif
                                        </div>
                                  </td>
                                  <td>
                                      <div class="d-flex justify-content-center">
                                          <div class="dropdown">
                                              <button class="btn at-dropdown-icon-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                  <img src="{{ asset('assets/frontend/images/icons/menu-dots-vertical-14.svg') }}" alt="icon">
                                              </button>
                                              <ul class="dropdown-menu dropdown-menu-end at-dropdown-menu">
                                              <li><a class="dropdown-item"  href="{{route('customer.invoice.download',['id'=>$order->id])}}" target="_blank" download>{{get_phrase('Download Invoice')}}</a></li>
                                              <li><a class="dropdown-item" onclick="delete_modal('{{route('customer.order.delete',['id'=>$order->id])}}')" href="javascript:void(0)">{{get_phrase('Delete')}}</a></li>
                                              </ul>
                                          </div>
                                      </div>
                                  </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="mt-20px d-flex align-items-center gap-3 justify-content-between flex-wrap ePagination">
                            <p class="in-subtitle-12px">{{get_phrase('Showing').'  to '.count($myOrders).' '.get_phrase('of').' '.count($myOrders).' '.get_phrase('results')}} </p>
                            <div class="d-flex align-items-center gap-1 flex-wrap ">
                                {{$myOrders->links()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@include('layouts.modal')

<script>
    "use strict";   
    document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.read-more').forEach(function (button) {
        button.addEventListener('click', function () {
            const parent = this.closest('p');
            const shortText = parent.querySelector('.short-text');
            const fullText = parent.querySelector('.full-text');

            if (shortText.classList.contains('d-inline')) {
                shortText.classList.remove('d-inline');
                shortText.classList.add('d-none');
                fullText.classList.remove('d-none');
                fullText.classList.add('d-inline');
                this.textContent = 'Show Less';
            } else {
                shortText.classList.remove('d-none');
                shortText.classList.add('d-inline');
                fullText.classList.remove('d-inline');
                fullText.classList.add('d-none');
                this.textContent = 'Read More';
            }
        });
    });
});


 </script>

@endsection