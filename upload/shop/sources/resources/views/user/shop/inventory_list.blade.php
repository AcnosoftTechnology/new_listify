<style>
    .border{
        text-align: center;
        padding: 14px;
        border-radius: 5px;
    }
    .eBorder {
        border: 1px solid #d8d8d8 !important;
        
    }
    .pr-0{
        padding-right: 0 !important;
    }
    .overflow-x-inherite{
        overflow-x: inherit ;
    }
    .nice-select {
	line-height: 15px !important;
}
.nice-select.open .list {
	width: 100%;
}
</style>
 

<div class="row">
    <div class="col-lg-8 ">
       
        @php 
            $inventories = App\Models\Inventory::where('type',$type)->where('listing_id', $listing->id)->get();
       @endphp
       @if(count($inventories) > 0)
       <h5 class="in-title-16px mb-3 capitalize"> {{ get_phrase('Product List') }} </h5>
       <div class="eBorder border">
        <table id="datatable" class="table nowrap responsive w-100 ">
            <thead>
                <tr>
                    <th class="ca-title-14px ca-text-dark"> {{ get_phrase('ID') }} </th>
                    <th class="ca-title-14px ca-text-dark"> {{ get_phrase('Product Name') }} </th>
                    <th class="ca-title-14px ca-text-dark"> {{ get_phrase('Category') }} </th>
                    <th class="ca-title-14px ca-text-dark capitalize"> {{ get_phrase('Price') }} </th>
                    <th class="ca-title-14px ca-text-dark"> {{ get_phrase('Availability') }} </th>
                    <th class="ca-title-14px ca-text-dark"> {{ get_phrase('Action') }} </th>
                </tr> 
            </thead>
            <tbody class="ca-tbody">
                @php $i = 1; @endphp
                @foreach($inventories as  $inventory)
                    @php 
                        $category = App\Models\InventoryCategory::where('id', $inventory->category_id)->first();
                    @endphp 
                    <tr class="ca-tr">
                        <td>{{$i++}}</td>
                        <td class="ca-subtitle-14px ca-text-dark min-w-110px">{{$inventory->name}}</td>
                        <td class="ca-subtitle-14px ca-text-dark min-w-110px">{{$category->name}}</td>
                        <td class="ca-subtitle-14px ca-text-dark min-w-110px">{{$inventory->price}}</td>
                        <td>
                            @if($inventory->availability == 1)
                            <span class="badge bg-success">{{get_phrase('stock')}}</span>
                            @else 
                            <span class="badge bg-warning">{{get_phrase('Out of stock')}}</span>
                            @endif
                        </td>
                        <td>
                            <div class="dropdown ol-icon-dropdown">
                                <button class="btn at-dropdown-icon-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="{{ asset('assets/frontend/images/icons/menu-dots-vertical-14.svg') }}" alt="icon">
                                </button> 
                                <ul class="dropdown-menu dropdown-menu-end at-dropdown-menu">
                                    <li><a class="dropdown-item fs-14px" onclick="edit_modal('modal-md','{{route('agent.inventory.edit',['type' => $type, 'listing_id'=>$listing->id,'inventory_id'=>$inventory->id])}}','{{get_phrase('Update Inventory')}}')" href="javascript:void(0);"> {{get_phrase('Edit')}} </a></li>
                                    <li><a class="dropdown-item fs-14px" onclick="delete_modal('{{route('agent.inventory.delete',[ 'id'=>$inventory->id])}}')" href="javascript:void(0);"> {{get_phrase('Delete')}} </a></a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach 

            </tbody>
        </table>
     </div>
        
        @endif
      
    </div>
    <div class="col-lg-4">
        @php 
         $inventoryCategory = App\Models\InventoryCategory::where('type',$type)->where('listing_id', $listing->id)->get();
        @endphp
        @if(count($inventoryCategory) > 0)
        <h5 class="in-title-16px mb-3 capitalize"> {{ get_phrase('Product Category') }} </h5>
        <div class="table-responsive overflow-x-inherite border pb-0 ps-0 pr-0">
            <table class="table ca-table ca-table-width  mb-2">
                <thead class="ca-thead">
                  <tr class="ca-tr">
                    <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('ID')}}</th>
                    <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Name')}}</th>
                    <th scope="col" class="ca-title-14px ca-text-dark">{{get_phrase('Action')}}</th>
                  </tr>
                </thead>
                <tbody class="ca-tbody">
                    @php $i = 1; @endphp
                    @foreach($inventoryCategory as $incategory)
                  
                    <tr class="ca-tr">
                        <td>{{$i++}}</td>
                         <td class="ca-subtitle-14px ca-text-dark min-w-110px">{{$incategory->name}}</td>
                  
                      <td>
                          <div class="d-flex justify-content-center">
                              <div class="dropdown">
                                  <button class="btn at-dropdown-icon-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                      <img src="{{ asset('assets/frontend/images/icons/menu-dots-vertical-14.svg') }}" alt="icon">
                                  </button> 
                                  <ul class="dropdown-menu dropdown-menu-end at-dropdown-menu">
                                    <li><a class="dropdown-item fs-14px" onclick="edit_modal('modal-md','{{route('agent.inventory.category.edit',['id'=>$incategory->id])}}','{{get_phrase('Update Category')}}')" href="javascript:void(0);"> {{get_phrase('Edit')}} </a></li>
                                    <li><a class="dropdown-item fs-14px" onclick="delete_modal('{{route('agent.inventory.category.delete',[ 'id'=>$incategory->id])}}')" href="javascript:void(0);"> {{get_phrase('Delete')}} </a></a></li>
                                  </ul>
                              </div>
                          </div>
                      </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
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
