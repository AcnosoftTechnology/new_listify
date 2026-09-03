@extends('layouts.admin')

@section('title', get_phrase('All Listings'))

@section('admin_layout')

<div class="container">

    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>S.No</th>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Visibility</th>
                <th>View Listing</th>
            </tr>
        </thead>

        <tbody>
            @forelse($listings as $key => $listing)
                <tr>
                    <td>{{ $listings->firstItem() + $key }}</td>
                    <td>{{ $listing->id }}</td>
                    <td>{{ $listing->title }}</td>
                    <td>{{ $listing->description }}</td>
                    <td>{{ $listing->visibility }}</td>

                    <td>
                        <a href="{{ url('details/' . ($listing->type ?? $type) . '/' . $listing->id . '/' . Str::slug($listing->title)) }}" target="_blank">
                            View
                            <i class="fi-rr-arrow-up-right-from-square text-12px text-muted"></i>
                        </a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" class="text-center">
                        No Listings Found
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <div class="mt-4 d-flex justify-content-center">
        {{ $listings->links() }}
    </div>

</div>

@endsection