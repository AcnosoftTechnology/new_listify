@extends('layouts.admin')
@section('title', get_phrase('My Order'))
@section('admin_layout')

<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-18px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
                {{ get_phrase('My Orders') }}
            </h4>
        </div>
    </div>
</div>

<div class="ol-card mt-3">
    <div class="ol-card-body p-3">
        @if(count($myOrders))
        <table id="datatable" class=" table nowrap w-100">
            <thead>
                <tr>
                    <th> {{get_phrase('ID')}} </th>
                    <th> {{get_phrase('Product Details')}} </th>
                    <th> {{get_phrase('Amount to Pay')}} </th>
                    <th> {{get_phrase('Delivered Details')}} </th>
                    <th> {{get_phrase('Date')}} </th>
                    <th> {{get_phrase('Action')}} </th>
                </tr>
            </thead>
            <tbody>
                @php $num = 1 @endphp
                @foreach ($myOrders as $order) 
                @php
                   $products = json_decode($order->product, true); 
               @endphp
                <tr>
                    <td> {{$num++}} </td>
                    <td>
                        <div class="dAdmin_profile d-flex align-items-center min-w-200px">
                            <div class="dAdmin_profile_name">
                                <p class="sub-title2 text-13px"><b>{{get_phrase('Product Type : ')}}</b> <span class="capitalize">{{$order->type}}</span></p>
                                @foreach ($products as $product)
                                @php
                                    $inventory = \App\Models\Inventory::find($product['product_id']);
                                @endphp
                                @if($inventory)
                                    <p class="sub-title2 text-13px">
                                       {{ $inventory->name }} X {{$product['quantity']}} <br>
                                    </p>
                                  @endif
                                 @endforeach
                                
                            </div>
                        </div> 
                    </td>
                    <td>
                        <div class="dAdmin_profile d-flex align-items-center min-w-200px">
                            <div class="dAdmin_profile_name">
                                <p class="sub-title2 text-13px"><b>{{get_phrase('Amount Pay : ')}}</b> {{currency($order->amount)}}</p>
                                <p class="sub-title2 text-13px"><b>{{get_phrase(' Status : ')}}</b>
                                   @if($order->payment_status == 'paid') 
                                        <span class="badge bg-success">{{ get_phrase('Paid') }}</span> 
                                    @else 
                                       <span class="badge bg-danger">{{ get_phrase('Pending') }}</span>
                                   @endif
                                </p>
                                
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dAdmin_profile d-flex align-items-center min-w-200px">
                            <div class="dAdmin_profile_name">
                                <p class="sub-title2 text-13px"><b>{{get_phrase('Contact : ')}}</b> {{$order->customer_phone}}</p>
                                <p class="sub-title2 text-13px"><b>{{get_phrase('Address : ')}} </b>{{$order->customer_address}}</p>
                                <p class="sub-title2 text-13px"><b>{{get_phrase(' Status : ')}}</b>
                                    @if($order->delivery_status == 'delivered') 
                                         <span class="badge bg-success">{{ get_phrase('Delivered') }}</span> 
                                     @else 
                                        <span class="badge bg-danger">{{ get_phrase('Pending') }}</span>
                                    @endif
                                 </p>
                                <p class="sub-title2 text-13px text-wrap"><b>{{get_phrase('Note : ')}}</b> {{$order->customer_message}}</p>
                                
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dAdmin_profile d-flex align-items-center min-w-200px">
                            <div class="dAdmin_profile_name">
                                @if($order->delivery_status == 'delivered') 
                                <p class="sub-title2 text-13px">{{ get_phrase('Delivered at  : ') }} {{ \Carbon\Carbon::parse($order->update_at)->format('D, d/M/Y') }}</p>
                                @else
                                <p class="sub-title2 text-13px">{{ get_phrase('Order placed at : ') }} {{ \Carbon\Carbon::parse($order->created_at)->format('D, d/M/Y') }}</p>
                                @endif
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown ol-icon-dropdown">
                            <button class="px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fi-rr-menu-dots-vertical"></span>
                            </button>
                            <ul class="dropdown-menu">
                              <li><a class="dropdown-item fs-14px"  href="{{route('admin.invoice.download',['id'=>$order->id])}}" target="_blank" download> {{get_phrase('Download Invoice')}} </a></a></li>
                              <li><a class="dropdown-item fs-14px" onclick="delete_modal('{{route('admin.order.shop.delete',['id'=>$order->id])}}')" href="javascript:void(0);" > {{get_phrase('Delete')}} </a></a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        @else
            @include('layouts.no_data_found')
        @endif
    </div>
</div>

@endsection