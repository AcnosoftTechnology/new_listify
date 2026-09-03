<form action="{{route('admin.inventory.store')}}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label for="name" class="form-label ol-form-label"> {{get_phrase('Product Name')}} </label>
        <input type="text" class="form-control ol-form-control" name="name" id="name" placeholder="{{get_phrase('Enter product name')}}" required>
    </div>
    <div class="mb-3">
        <label for="category_id" class="form-label ol-form-label"> {{get_phrase('Category')}} </label>
        <select name="category_id" id="category_id" class="form-control ol-select2 ol-form-control">
            <option value=""> {{get_phrase('Select category')}} </option>
            @php 
                $inventoryCategory = App\Models\InventoryCategory::where('type',$type)->where('listing_id', $listing_id)->get();
            @endphp
            @foreach($inventoryCategory as $category)
               <option value="{{$category->id}}"> {{$category->name}} </option>
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label for="price" class="form-label ol-form-label capitalize"> {{get_phrase('Price')}} </label>
        <input class="form-control ol-form-control" name="price" id="price" type="number" placeholder="{{get_phrase('Enter price')}}" required>
    </div>
    <div class="mb-3">
        <label for="description" class="form-label ol-form-label"> {{get_phrase('Description')}} </label>
        <textarea class="form-control mform-control review-textarea" name="description" required></textarea>
        <p style="font-size: 13px;">{{get_phrase('Description must not exceed 73 characters.')}}</p>
    </div>
    <div class="mb-3">
        <label for="image" class="form-label ol-form-label"> {{get_phrase('Upload product image')}} </label>
        <input class="form-control ol-form-control" name="image" id="image" type="file" required>
    </div>
    <div class="mb-3">
        <label for="image" class="form-label ol-form-label"> {{get_phrase('Availability')}} </label>
        <div class="dl-gender-wrap d-flex justify-content-start gap-3">
            <div class="gender-item">
                <div class="form-check">
                    <input type="radio" name="availability" class="form-check-input dl-radio" value="1" checked id="available" /><label for="available" class="form-check-label">{{ get_phrase('Available ') }}</label>
                </div>
            </div>
            <div class="gender-item">
                <div class="form-check">
                    <input type="radio" name="availability" class="form-check-input dl-radio" value="0" id="notavailable"  /><label for="notavailable" class="form-check-label">{{ get_phrase('Not available ') }}</label>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden"  name="type" value="{{$type}}">
    <input type="hidden"  name="listing_id" value="{{$listing_id}}">
    <div>
        <button type="submit" class="btn ol-btn-primary "> {{get_phrase('Create')}} </button>
    </div>
</form>

<script>
    "use strict";
    $(document).ready(function() {
        $('.ol-select2').select2({
            dropdownParent: $('#ajax-modal')
        });
    });
</script>