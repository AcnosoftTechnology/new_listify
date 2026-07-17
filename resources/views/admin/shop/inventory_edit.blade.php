<form action="{{ route('admin.inventory.update', $inventory->id) }}" method="post" enctype="multipart/form-data">

    @csrf
    <div class="mb-3">
        <label for="name" class="form-label ol-form-label"> {{get_phrase('Product Name')}} </label>
        <input type="text" class="form-control ol-form-control" name="name" id="name" value="{{$inventory->name}}" required>
    </div>
    <div class="mb-3">
        <label for="category_id_2" class="form-label ol-form-label"> {{get_phrase('Category')}} </label>
        <select name="category_id" id="category_id_2" class="form-control ol-select2 ol-form-control">
            <option value=""> {{get_phrase('Select category')}} </option>
            @php 
                $inventoryCategory = App\Models\InventoryCategory::where('type',$type)->where('listing_id', $listing_id)->get();
            @endphp
            @foreach($inventoryCategory as $category)
            <option value="{{$category->id}}" @if($inventory->category_id == $category->id) selected @endif>
                {{$category->name}}
            </option>
            
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label for="price" class="form-label ol-form-label capitalize"> {{get_phrase('Price')}} </label>
        <input class="form-control ol-form-control" name="price" id="price" type="text" value="{{$inventory->price}}" required>
    </div>
    <div class="mb-3">
        <label for="description" class="form-label ol-form-label"> {{get_phrase('Description')}} </label>
        <textarea class="form-control mform-control review-textarea" name="description" required>{{$inventory->description}}</textarea>
    </div>
    <div>
        <img src="{{get_all_image('inventory/'.$inventory->image)}}" style="height: 120px; width: 120px; object-fit: cover; border-radius: 5px; margin-bottom: 10px;" alt="">
    </div>
    <div class="mb-3">
        <label for="image" class="form-label ol-form-label"> {{get_phrase('Upload product image')}} </label>
        <input class="form-control ol-form-control" name="image" id="image" type="file">
    </div>
    <div class="mb-3">
        <label for="image" class="form-label ol-form-label"> {{get_phrase('Availability')}} </label>
            <div class="dl-gender-wrap d-flex justify-content-start gap-3">
                <div class="gender-item">
                    <div class="form-check">
                        <input type="radio" name="availability" class="form-check-input dl-radio" value="1"
                            @if(isset($inventory) && $inventory->availability == 1) checked @endif
                            id="available" />
                        <label for="available" class="form-check-label">{{ get_phrase('Available') }}</label>
                    </div>
                </div>
                <div class="gender-item">
                    <div class="form-check">
                        <input type="radio" name="availability" class="form-check-input dl-radio" value="0"
                            @if(isset($inventory) && $inventory->availability == 0) checked @endif
                            id="notavailable" />
                        <label for="notavailable" class="form-check-label">{{ get_phrase('Not available') }}</label>
                    </div>
                </div>
            </div>
       </div>

    <div>
        <button type="submit" class="btn ol-btn-primary "> {{get_phrase('Update')}} </button>
    </div>
</form>

{{-- <script>
    "use strict";
    $(document).ready(function() {
        $('.ol-select2').select2({
            dropdownParent: $('#ajax-modals')
        });
    });
</script> --}}