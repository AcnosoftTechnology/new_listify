<form action="{{route('admin.inventory.category.store')}}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label for="name" class="form-label ol-form-label"> {{get_phrase('Category Title')}} </label>
        <input type="text" class="form-control ol-form-control" name="name" id="name" placeholder="{{get_phrase('provide category name')}}" required>
    </div>
    <input type="hidden" value="{{$type}}" name="type" value="{{$type}}">
    <input type="hidden" value="{{$listing_id}}" name="listing_id" value="{{$listing_id}}">
    <div>
        <button type="submit" class="btn ol-btn-primary "> {{get_phrase('Create')}} </button>
    </div>
</form>