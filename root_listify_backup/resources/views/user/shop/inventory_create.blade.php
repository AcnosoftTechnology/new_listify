
<link rel="stylesheet" type="text/css" href="/public/assets/backend/icon-picker/fontawesome-iconpicker.min.css" />
<link rel="stylesheet" type="text/css" href="/public/assets/backend/icon-picker/icons/fontawesome-all.min.css" />

<form action="{{route('agent.inventory.store')}}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label for="name" class="form-label cap-form-label"> {{get_phrase('Product Name')}} </label>
        <input type="text" class="form-control cap-form-control" name="name" id="name" placeholder="{{get_phrase('Enter product name')}}" required>
    </div>
    <div class="mb-3">
        <label for="category_id" class="form-label cap-form-label w-100"> {{get_phrase('Category')}} </label>
        <select name="category_id" id="" class="form-control cap-form-control mb-2 cap-select2 nice-selected w-100">
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
        <label for="price" class="form-label cap-form-label capitalize"> {{get_phrase('Price')}} </label>
        <input class="form-control cap-form-control" name="price" id="price" type="number" placeholder="{{get_phrase('Enter price')}}" required>
    </div>
    <div class="mb-3">
        <label for="discount_price" class="form-label cap-form-label capitalize"> {{get_phrase('Discount %')}} </label>
        <input class="form-control cap-form-control" name="discount_price" id="discount_price" type="number" placeholder="{{get_phrase('Enter Discount price in %')}}" required>
    </div>
    <div class="mb-3">
        <label for="description" class="form-label cap-form-label"> {{get_phrase('Description')}} </label>
        <textarea class="form-control mform-control review-textarea" name="description" required></textarea>
        <p style="font-size: 13px;">{{get_phrase('Description must not exceed 73 characters.')}}</p>
    </div>
    <div class="mb-3">
        <label for="additional_info" class="form-label cap-form-label"> {{get_phrase('Additional Information')}} </label>
        <textarea class="form-control mform-control review-textarea" name="additional_info" required></textarea>
        <p style="font-size: 13px;">{{get_phrase('Additional Information must not exceed 73 characters.')}}</p>
    </div>
    <div class="mb-3">
        <label for="image" class="form-label cap-form-label"> {{get_phrase('Upload product image')}} </label>
        <input class="form-control cap-form-control" name="image" id="image" type="file" required>
    </div>
    <div class="mb-3">
        <label for="image" class="form-label cap-form-label"> {{get_phrase('Availability')}} </label>
        <div class="dl-gender-wrap d-flex justify-content-start gap-3">
            <div class="gender-item">
                <div class="form-check">
                    <input type="radio" name="availability" class="form-check-input form-label cap-form-label dl-radio" value="1" checked id="available" /><label for="available" class="form-check-label">{{ get_phrase('Available ') }}</label>
                </div>
            </div>
            <div class="gender-item">
                <div class="form-check">
                    <input type="radio" name="availability" class="form-check-input form-label cap-form-label dl-radio" value="0" id="notavailable"  /><label for="notavailable" class="form-check-label">{{ get_phrase('Not available ') }}</label>
                </div>
            </div>
        </div>
    </div>
  
    
<div class="mb-3">
  <label for="icon" class="form-label cap-form-label"> {{get_phrase('Special Features')}} </label>
  
  <div id="special-features-wrapper">
    <div class="d-flex mb-2 feature-item">
      <input class="form-control ol-form-control icp icp-auto m-1" 
             name="icon[]" 
             placeholder="{{get_phrase('Pick an Feature ')}}" 
             type="text" required>

      <input class="form-control cap-form-control m-1" 
             name="icon_title[]" 
             placeholder="{{get_phrase('Enter Feature  Name')}}" 
             required>

      <button type="button" class="btn btn-danger remove-feature m-1">X</button>
    </div>
  </div>

  <button type="button" class="btn btn-primary mt-2" id="add-feature">
    + Add
  </button>
</div>


  
  

    <input type="hidden"  name="type" value="{{$type}}">
    <input type="hidden"  name="listing_id" value="{{$listing_id}}">
    <div>
        <button type="submit" class="btn ol-btn-primary "> {{get_phrase('Create')}} </button>
    </div>
  
</form>

<script>
$(document).ready(function () {
    $('.icp-auto').iconpicker();

    $('.ol-select2').select2({
        dropdownParent: $('#ajax-modal')
    });

    $("#add-feature").click(function () {
        let newField = `
        <div class="d-flex mb-2 feature-item">
          <input class="form-control ol-form-control icp icp-auto m-1" 
                 name="icon[]" 
                 placeholder="{{get_phrase('Pick an Feature ')}}" 
                 type="text" required>

          <input class="form-control cap-form-control m-1" 
                 name="icon_title[]" 
                 placeholder="{{get_phrase('Enter Feature  Name')}}" 
                 required>

          <button type="button" class="btn btn-danger remove-feature m-1">X</button>
        </div>`;

        let $newElem = $(newField).appendTo("#special-features-wrapper");

        $newElem.find('.icp-auto').iconpicker();
    });

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