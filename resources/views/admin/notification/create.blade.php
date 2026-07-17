@extends('layouts.admin')
@section('title', get_phrase('Notification'))
@section('admin_layout')




<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-20px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
                {{ get_phrase('Create Notifications') }}
            </h4>         
        </div>      
    </div>  
</div>

  <div class="ol-card ol-card-body my-2 py-20px px-20px p-3">
    
     <form action="{{ route('admin.notifications.store') }}" method="post" enctype="multipart/form-data">
 @csrf
        <div class="row">
           <div class="col-sm-12 mb-3">
               <label for="title" class="form-label ol-form-label"> Title </label>
               <input type="text" class="form-control ol-form-control" name="title" id="title" placeholder="Enter your title">
           </div>
           <div class="col-sm-12 mb-3">
                <label for="description" class="form-label ol-form-label">Description</label>
                <textarea class="form-control ol-form-control" name="description" id="description" placeholder="Enter description" rows="4"></textarea>
           </div>
          
          <div class="col-sm-6 mb-3">
            <label for="user_id" class="form-label ol-form-label">Select Users</label>
              <select name="user_id[]" id="users" class="form-control select2" multiple>
                  @foreach($users as $user)
                      <option value="{{ $user->id }}">{{ $user->name }}</option>
                  @endforeach
              </select>
            <!-- Buttons for Select All / Deselect All -->
              <div class="mt-3">
              <button type="button" id="select-all" class="btn btn-sm btn-primary">Select All</button>
              <button type="button" id="deselect-all" class="btn btn-sm btn-danger">Deselect All</button>
              </div>
          </div>          

         <div class="col-sm-6 mb-3">
           <label for="media" class="form-label ol-form-label">Upload Picture</label>
           <input type="file" class="form-control ol-form-control" name="media" id="media" accept="image/*">
        </div>

          
          <div class="col-sm-12 mb-3">
            <label for="status" class="form-label ol-form-label"> Status </label>
            <select class="form-control ol-form-control" name="status" id="status">
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
          </div>
          
          <div class="col-sm-12 mb-3">
          <button type="submit" class="btn ol-btn-primary fs-14px"> Update </button>
          </div>  

        </div>
      </form>
  </div>

<script>
    $(document).ready(function() {
        $('#users').select2({
            placeholder: "Search or select users",
            allowClear: true
        });
        $('#select-all').click(function() {
            var allValues = [];
            $('#users option').each(function() {
                allValues.push($(this).val());
            });
            $('#users').val(allValues).trigger('change');
        });
        $('#deselect-all').click(function() {
            $('#users').val(null).trigger('change');
        });
    });
</script>

@endsection

