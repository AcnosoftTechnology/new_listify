

<link rel="stylesheet" type="text/css" href="/public/assets/backend/icon-picker/fontawesome-iconpicker.min.css" />
<link rel="stylesheet" type="text/css" href="/public/assets/backend/icon-picker/icons/fontawesome-all.min.css" />
<form action="{{ route('agent.inventory.update', $inventory->id) }}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label for="name" class="form-label cap-form-label"> {{get_phrase('Product Name')}} </label>
        <input type="text" class="form-control cap-form-control" name="name" id="name" value="{{$inventory->name}}" required>
    </div>
    <div class="mb-3">
        <label for="category_id" class="form-label cap-form-label w-100"> {{get_phrase('Category')}} </label>
        <select name="category_id" id="category_id" class="form-control cap-form-control mb-2 cap-select2 nice-selected w-100">
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
        <label for="price" class="form-label cap-form-label capitalize"> {{get_phrase('Price')}} </label>
        <input class="form-control cap-form-control" name="price" id="price" type="text" value="{{$inventory->price}}" required>
    </div>
  
      <div class="mb-3">
        <label for="discount_price" class="form-label cap-form-label capitalize"> {{get_phrase('Discount %')}} </label>
        <input class="form-control cap-form-control" name="discount_price" id="discount_price" type="text" value="{{$inventory->discount_price}}" required>
    </div>
  
    <div class="mb-3">
        <label for="description" class="form-label cap-form-label"> {{get_phrase('Description')}} </label>
        <textarea class="form-control cap-form-control mform-control review-textarea" name="description" required>{{$inventory->description}}</textarea>
    </div>
    <div class="mb-3">
        <label for="additional_info" class="form-label cap-form-label"> {{get_phrase('Additional Infomation')}} </label>
        <textarea class="form-control cap-form-control mform-control review-textarea" name="additional_info" required>{{$inventory->additional_info}}</textarea>
    </div>
    <div>
        <img src="{{get_all_image('inventory/'.$inventory->image)}}" style="height: 120px; width: 120px; object-fit: cover; border-radius: 5px; margin-bottom: 10px;" alt="">
    </div>
    <div class="mb-3">
        <label for="image" class="form-label cap-form-label"> {{get_phrase('Upload product image')}} </label>
        <input class="form-control cap-form-control" name="image" id="image" type="file">
    </div>
    <div class="mb-3">
        <label for="availability" class="form-label cap-form-label"> {{get_phrase('Availability')}} </label>
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


<div class="mb-3">
  <label for="icon" class="form-label cap-form-label"> 
    {{ get_phrase('Special Features') }} 
  </label>

  <div id="special-features-wrapper">
    @php
        $features = !empty($inventory->icon_data) ? json_decode($inventory->icon_data, true) : [];
    @endphp

    @if(!empty($features))
        @foreach($features as $feature)
          <div class="d-flex mb-2 feature-item">
            <input class="form-control ol-form-control icp icp-auto m-1" 
                   name="icon[]" 
                   type="text" 
                   value="{{ $feature['icon'] ?? '' }}" 
                   placeholder="{{ get_phrase('Pick an Feature ') }}" 
                   required>

            <input class="form-control cap-form-control m-1" 
                   name="icon_title[]" 
                   type="text" 
                   value="{{ $feature['title'] ?? '' }}" 
                   placeholder="{{ get_phrase('Enter Feature Name') }}" 
                   required>

            <button type="button" class="btn btn-danger remove-feature m-1">X</button>
          </div>
        @endforeach
    @else
        {{-- If no features, show one empty row --}}
        <div class="d-flex mb-2 feature-item">
          <input class="form-control ol-form-control icp icp-auto m-1" 
                 name="icon[]" 
                 placeholder="{{ get_phrase('Pick an Feature') }}" 
                 type="text" required>

          <input class="form-control cap-form-control m-1" 
                 name="icon_title[]" 
                 placeholder="{{ get_phrase('Enter Feature Name') }}" 
                 required>

          <button type="button" class="btn btn-danger remove-feature m-1">X</button>
        </div>
    @endif
  </div>

  <button type="button" class="btn btn-primary mt-2" id="add-feature">
    + Add
  </button>
</div>

  
  
    <div>
        <button type="submit" class="btn ol-btn-primary "> {{get_phrase('Update')}} </button>
    </div>
</form>

<script>
$(document).ready(function () {
    // Initialize iconpicker for existing fields
    $('.icp-auto').iconpicker();

    // Add new field dynamically
    $("#add-feature").click(function () {
        let newField = `
        <div class="d-flex mb-2 feature-item">
          <input class="form-control ol-form-control icp icp-auto m-1" 
                 name="icon[]" 
                 placeholder="{{ get_phrase('Pick an Feature') }}" 
                 type="text" required>

          <input class="form-control cap-form-control m-1" 
                 name="icon_title[]" 
                 placeholder="{{ get_phrase('Enter Feature Name') }}" 
                 required>

          <button type="button" class="btn btn-danger remove-feature m-1">X</button>
        </div>`;

        let $newElem = $(newField).appendTo("#special-features-wrapper");

        // re-init iconpicker for new field
        $newElem.find('.icp-auto').iconpicker();
    });

    // Remove field
    $(document).on("click", ".remove-feature", function () {
        $(this).closest(".feature-item").remove();
    });
});
</script>


<script>
    "use strict";
    $(document).ready(function() {
        $('.nice-selected').niceSelect();
    });
</script>
 <script src="/public/assets/backend/icon-picker/fontawesome-iconpicker.min.js"></script>