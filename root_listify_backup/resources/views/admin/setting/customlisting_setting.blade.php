@extends('layouts.admin')
@section('title', get_phrase('System Settings'))
@section('admin_layout')

<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-20px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
                {{ get_phrase('Custom Listing Settings') }}
            </h4>
            <a href="{{route('admin.Customlisting_settings.add')}}" class="btn ol-btn-outline-secondary d-flex align-items-center cg-10px">
               <i class="fa fa-plus me-1"></i> <span>{{ get_phrase('Add New') }}</span>
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
            <th>Listing Type</th>
            <th>Banner Image</th>
            <th>Banner Title</th>
            <th>Banner Description</th>            
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach($all_customlisting as $listing)
            <tr>
              <td>{{ $listing->listing_type }}</td>
                <td>
                    @if($listing->banner_bg_image)
                        <img src="{{ asset($listing->banner_bg_image) }}" alt="Banner Image" width="120">
                    @else
                        <span class="text-muted">No Image</span>
                    @endif
                </td>
                <td>{{ $listing->banner_title }}</td>
                <td>{{ Str::limit($listing->banner_description, 100) }}</td>
                <td>
                    <a href="{{ route('admin.Customlisting_settings.edit', $listing->id) }}" class="btn btn-sm btn-primary">Edit</a>
                    <form action="{{ route('admin.Customlisting_settings.destroy', $listing->id) }}" method="POST" style="display:inline-block;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure want to delete this?')">Delete</button>
                    </form>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

       </div>
    </div>
</div>  
@endsection