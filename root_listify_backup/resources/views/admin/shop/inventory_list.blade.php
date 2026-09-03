<style>
    .border{
        border-bottom: 0 !important;
        padding: 14px;
        border-radius: 5px;
    }
    .eBorder {
        border: 1px solid #d8d8d8 !important;
        
    }
    .pr-0{
        padding-right: 0 !important;
    }
</style>

<div class="row">
    <div class="col-lg-8 ">
       
        @php 
            $inventories = App\Models\Inventory::where('type',$type)->where('listing_id', $listing->id)->get();
       @endphp
       @if(count($inventories) > 0)
       <h5 class="fs-16px title mb-3 capitalize"> {{ get_phrase('Product List') }} </h5>
       <div class="eBorder border">
        <table id="datatable" class="table nowrap responsive w-100 ">
            <thead>
                <tr>
                    <th> {{ get_phrase('ID') }} </th>
                    <th> {{ get_phrase('Product Name') }} </th>
                    <th> {{ get_phrase('Category') }} </th>
                    <th class="capitalize"> {{ get_phrase('Price') }} </th>
                    <th> {{ get_phrase('Availability') }} </th>
                    <th> {{ get_phrase('Action') }} </th>
                </tr> 
            </thead>
            <tbody>
                @php $i = 1; @endphp
                @foreach($inventories as  $inventory)
                    @php 
                        $category = App\Models\InventoryCategory::where('id', $inventory->category_id)->first();
                    @endphp 
                    <tr>
                        <td>{{$i++}}</td>
                        <td>{{$inventory->name}}</td>
                        <td>{{$category->name}}</td>
                        <td >{{$inventory->price}}</td>
                        <td>
                            @if($inventory->availability == 1)
                            <span class="badge bg-success">{{get_phrase('stock')}}</span>
                            @else 
                            <span class="badge bg-warning">{{get_phrase('Out of stock')}}</span>
                            @endif
                        </td>
                        <td>
                            <div class="dropdown ol-icon-dropdown">
                                <button class="px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fi-rr-menu-dots-vertical"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item fs-14px" onclick="edit_modal('modal-md','{{route('admin.inventory.edit',['type' => $type, 'listing_id'=>$listing->id,'inventory_id'=>$inventory->id])}}','{{get_phrase('Update Inventory')}}')" href="javascript:void(0);"> {{get_phrase('Edit')}} </a></li>
                                    <li><a class="dropdown-item fs-14px" onclick="delete_modal('{{route('admin.inventory.delete',[ 'id'=>$inventory->id])}}')" href="javascript:void(0);"> {{get_phrase('Delete')}} </a></a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach 

            </tbody>
        </table>
    </div>
        @else 
            @include('layouts.no_data_found')
        @endif
      
    </div>
    <div class="col-lg-4">
        @php 
         $inventoryCategory = App\Models\InventoryCategory::where('type',$type)->where('listing_id', $listing->id)->get();
        @endphp
        @if(count($inventoryCategory) > 0)
        <h5 class="fs-16px title mb-3 capitalize"> {{ get_phrase('Category List') }} </h5>
        <div class="table-responsive border pb-0 ps-0 pr-0">
            <table id="basic-datatable" class="table eTable mb-0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>{{ get_phrase('Name') }}</th>
                        <th >{{ get_phrase('Actions') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @php $i = 1; @endphp
                    @foreach($inventoryCategory as $incategory)
                    <tr>
                        <td>{{$i++}}</td>
                        <td>{{$incategory->name}}</td>
                        <td>
                            <div class="dropdown ol-icon-dropdown">
                                <button class="px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fi-rr-menu-dots-vertical"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item fs-14px" onclick="edit_modal('modal-md','{{route('admin.inventory.category.edit',['id'=>$incategory->id])}}','{{get_phrase('Update Category')}}')" href="javascript:void(0);"> {{get_phrase('Edit')}} </a></li>
                                    <li><a class="dropdown-item fs-14px" onclick="delete_modal('{{route('admin.inventory.category.delete',[ 'id'=>$incategory->id])}}')" href="javascript:void(0);"> {{get_phrase('Delete')}} </a></a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        @else 
       
        @endif

    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        const tabButtons = document.querySelectorAll('button[data-bs-toggle="tab"]');
        tabButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                localStorage.setItem('activeTab', this.getAttribute('data-bs-target'));
            });
        });
        let activeTab = localStorage.getItem('activeTab');
        if (activeTab) {
            let triggerTab = document.querySelector(`button[data-bs-target="${activeTab}"]`);
            if (triggerTab) {
                new bootstrap.Tab(triggerTab).show();
            }
        }
    });
</script>