@extends('layouts.admin')
@section('title', get_phrase('Notification'))
@section('admin_layout')




<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-20px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
                {{ get_phrase('Edit Notifications') }}
            </h4>         
        </div>      
    </div>  
</div>

<div class="ol-card ol-card-body my-2 py-20px px-20px p-3">
    
     <form action="{{ route('admin.notification.update', $notification->id) }}" method="post" enctype="multipart/form-data">
      @csrf
        <div class="row">
            <div class="col-sm-12 mb-3">
               <label for="title" class="form-label ol-form-label"> Title </label>
               <input type="text" name="title" class="form-control" value="{{ old('title', $notification->title) }}">
             </div>

            <div class="col-sm-12 mb-3">
                <label for="description" class="form-label ol-form-label">Description</label>
                <textarea name="description" class="form-control">{{ old('description', $notification->description) }}</textarea>
            </div>

            <div class="col-sm-6 mb-3">
              <label for="user_id" class="form-label ol-form-label">Users</label>
              <select name="user_id" id="users" class="form-control select2" multiple>
                @foreach($users as $user)
                    <option value="{{ $user->id }}" {{ $user->id == $notification->user_id ? 'selected' : '' }}  readonly />
                        {{ $user->name }}
                    </option>
                @endforeach
              </select>
            </div> 

            <!-- Media -->
             <div class="col-sm-6 mb-3">
                <div class="form-group">
                        <label>Media</label>
                        @if($notification->media)
                            <div class="mb-2">
                                <img src="{{ asset('uploads/notifications/' . $notification->media) }}" 
                                    width="100" height="100" style="object-fit:cover;" />
                            </div>
                        @endif
                        <input type="file" name="media" class="form-control">
                    </div>
              </div>

            <!-- Status -->
                <div class="col-sm-12 mb-3">
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" class="form-control">
                            <option value="1" {{ $notification->status == 1 ? 'selected' : '' }}>Active</option>
                            <option value="0" {{ $notification->status == 0 ? 'selected' : '' }}>Inactive</option>
                        </select>
                    </div>
                </div> 

            <div class="col-sm-12 mb-3">
              <button type="submit" class="btn btn-success">Update</button>
            </div> 

        </div>

      </form>
  </div>


@endsection

