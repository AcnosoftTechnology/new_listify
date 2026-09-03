@extends('layouts.admin')
@section('title', get_phrase('Order Manager'))
@section('admin_layout')

<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-18px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
                {{ get_phrase('List of Order Manager') }}
            </h4>
        </div>
    </div>
</div>


<div class="row justify-content-center mt-3">
    <div class="col-xl-12">
        <div class="ol-card p-4">
            <div class="ol-card-body">
                <div class="col-md-12 pb-3">
                    <ul class="nav nav-tabs eNav-Tabs-custom eTab" id="myTab" role="tablist">
                       
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pending_information-tab" data-bs-toggle="tab" data-bs-target="#pending_information"
                                type="button" role="tab" aria-controls="pending_information" aria-selected="false">
                                {{ get_phrase('Pending Orders') }}
                                <span></span>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="contact_information-tab" data-bs-toggle="tab" data-bs-target="#contact_information"
                                type="button" role="tab" aria-controls="contact_information" aria-selected="false">
                                {{ get_phrase('Delivered orders') }}
                                <span></span>
                            </button>
                        </li>
                       
                    </ul>
                    <div class="tab-content eNav-Tabs-content" id="myTabContent">
                        
                        <div class="tab-pane fade show active" id="pending_information" role="tabpanel"  aria-labelledby="pending_information-tab">
                            <div class="ol-card mt-3">
                                <div class="ol-card-body p-3">
                                    @if(count($pendingOrders))
                                    <table id="datatable" class=" table nowrap w-100">
                                        <thead>
                                            <tr>
                                                <th> {{get_phrase('ID')}} </th>
                                                <th> {{get_phrase('Customer name')}} </th>
                                                <th> {{get_phrase('Product Details')}} </th>
                                                <th> {{get_phrase('Amount To Pay')}} </th>
                                                <th> {{get_phrase('Delivered Details')}} </th>
                                                <th> {{get_phrase('Order placed At')}} </th>
                                                <th> {{get_phrase('Action')}} </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php $num = 1; @endphp
                                            @foreach($pendingOrders as $order)
                                            @php
                                            $products = json_decode($order->product, true); 
                                        @endphp
                                                <tr>
                                                    <td> {{$num++}} </td>
                                                    <td>
                                                        <div class="dAdmin_profile d-flex align-items-center min-w-200px">
                                                            <div class="dAdmin_profile_name">
                                                                <p class="sub-title2 text-13px"> {{ $order->customer_name ?? 'N/A' }} </p>
                                                            </div>
                                                        </div> 
                                                    </td>
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
                                                                <p class="sub-title2 text-13px"><b>{{get_phrase('Amount : ')}}</b> {{currency($order->amount)}}</p>
                                                                <p class="sub-title2 text-13px"><b>{{get_phrase('Status : ')}}</b>
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
                                                                <p class="sub-title2 text-13px">   {{ \Carbon\Carbon::parse($order->created_at)->format('D, d/M/Y') }}
                                                                </p>
                                                                
                                                            </div>
                                                        </div> 
                                                    </td>
                                                    <td>
                                                        <div class="dropdown ol-icon-dropdown">
                                                            <button class="px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <span class="fi-rr-menu-dots-vertical"></span>
                                                            </button>
                                                            <ul class="dropdown-menu">
                                                            <li><a class="dropdown-item fs-14px" onclick="confirm_modal('{{route('admin.shop.paid',['id'=>$order->id])}}')" href="javascript:void(0);" > {{get_phrase('Mark as Paid')}} </a></a></li>
                                                            <li><a class="dropdown-item fs-14px" onclick="confirm_modal('{{route('admin.shop.delivered',['id'=>$order->id])}}')" href="javascript:void(0);" > {{get_phrase('Mark as Delivered')}} </a></a></li>
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
                        </div>
                        <div class="tab-pane fade" id="contact_information" role="tabpanel"  aria-labelledby="contact_information-tab">

                            <div class="ol-card mt-3">
                                <div class="ol-card-body p-3">
                                    @if(count($DeliveryOrders)) 
                                    <table id="datatable2" class=" table nowrap w-100">
                                        <thead>
                                            <tr>
                                                <th> {{get_phrase('ID')}} </th>
                                                <th> {{get_phrase('Customer name')}} </th>
                                                <th> {{get_phrase('Product Details')}} </th>
                                                <th> {{get_phrase('Amount To Pay')}} </th>
                                                <th> {{get_phrase('Delivered Details')}} </th>
                                                <th> {{get_phrase('Order Delivered At')}} </th>
                                                <th> {{get_phrase('Action')}} </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php $num = 1; @endphp
                                            @foreach($DeliveryOrders as $order)
                                            @php
                                            $products = json_decode($order->product, true); 
                                        @endphp
                                                <tr>
                                                    <td> {{$num++}} </td>
                                                    <td>
                                                        <div class="dAdmin_profile d-flex align-items-center min-w-200px">
                                                            <div class="dAdmin_profile_name">
                                                                <p class="sub-title2 text-13px"> {{ $order->customer_name ?? 'N/A' }} </p>
                                                            </div>
                                                        </div> 
                                                    </td>
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
                                                                <p class="sub-title2 text-13px"><b>{{get_phrase('Amount : ')}}</b> {{currency($order->amount)}}</p>
                                                                <p class="sub-title2 text-13px"><b>{{get_phrase('Status : ')}}</b>
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
                                                                <p class="sub-title2 text-13px">   {{ \Carbon\Carbon::parse($order->updated_at)->format('D, d/M/Y') }}
                                                                </p>
                                                                
                                                            </div>
                                                        </div> 
                                                    </td>
                                                    <td>
                                                        <div class="dropdown ol-icon-dropdown">
                                                            <button class="px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <span class="fi-rr-menu-dots-vertical"></span>
                                                            </button>
                                                            <ul class="dropdown-menu">
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

                        </div>
                    </div>
                </div>
            </div> <!-- end card-body-->
        </div>
    </div>
</div>

<script src="{{asset('assets/backend/js/dataTables.js')}}"></script>
<script src="{{asset('assets/backend/js/dataTables.bootstrap5.js')}}"></script>
<script src="{{asset('assets/backend/js/dataTables.responsive.js')}}"></script>

<script>
    "use strict";


    $('#datatable2').DataTable({
        responsive: true
    })
 
 </script>

@endsection
