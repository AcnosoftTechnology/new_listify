@extends('layouts.admin')
@section('title', get_phrase('Notification'))
@section('admin_layout')

<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-20px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
                {{ get_phrase('Notifications') }}
            </h4>
          
          <a href="{{ route('admin.notification.create')}}" class="btn ol-btn-outline-secondary d-flex align-items-center cg-10px">
             <span class="fi-rr-plus"></span>
             <span> {{ get_phrase('Create Notification') }} </span>
          </a>
          
        </div>
    </div>
</div>


<div class="ol-card radius-8px">
    <div class="ol-card ol-card-body my-2 py-20px px-20px p-3">
        <div class="">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>User Name</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($noti as $notification)
                        <tr>
                          
                       <!-- Image -->
                         <td style="display: flex;justify-content: center;">
                            @if($notification->media)
                             <img src="{{ asset('uploads/notifications/' . $notification->media) }}"alt="Notification Image"class="img-fluid rounded"style="width: 50px; height: 50px; object-fit: cover;">
                                @else
                                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
                                         style="border:1px solid #ddd; border-radius:8px; padding:10px;">
                                        <path d="M12 2C10.3431 2 9 3.34315 9 5V6.26505C6.19124 7.15004 4.25 9.82885 4.25 13V17L3 18.25V19H21V18.25L19.75 17V13C19.75 9.82885 17.8088 7.15004 15 6.26505V5C15 3.34315 13.6569 2 12 2Z" 
                                              stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M14 21C14 22.1046 13.1046 23 12 23C10.8954 23 10 22.1046 10 21" 
                                              stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                @endif
                            </td>

                            <!-- User ID -->
                            <td>{{ $notification->user_title ?? 'N/A' }}</td>

                            <!-- Title -->
                            <td>{{ $notification->title }}</td>

                            <!-- Description -->
                            <td>{{ Str::limit($notification->description, 60) }}</td>
                          
                            <!-- status -->
                            <td>
                              @if($notification->status == 1)
                              <button class="btn btn-success">Active</button>
                              @else
                              <button class="btn btn-danger">Inactive</button>
                              @endif
                            </td>


                            <!-- Edit Button -->
                            <td style="gap:2px;">
                              <a href="{{ route('admin.notification.edit', $notification->id) }}" class="btn btn-sm btn-primary">
                                  <i class="fas fa-edit"></i> 
                              </a>

                              <form action="{{ route('admin.notification.destroy', $notification->id) }}" method="POST" style="display:inline;">
    @csrf
    @method('DELETE')
    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this notification?')">
        <i class="fas fa-trash"></i>
    </button>
</form>

                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
          
                      <!-- ✅ Pagination Links -->
            <div class="d-flex justify-content-end">
                {{ $noti->links('pagination::bootstrap-5') }}
            </div>
          
        </div>
    </div>
</div>


@endsection