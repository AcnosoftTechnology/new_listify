<form action="{{route('agent.inventory.category.update',['id'=>$inventory_category->id])}}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label for="name" class="form-label cap-form-label"> {{get_phrase('Category Title')}} </label>
        <input type="text" class="form-control cap-form-control" name="name" id="name" value="{{$inventory_category->name}}" required>
    </div>
    
    <div>
        <button type="submit" class="btn ol-btn-primary "> {{get_phrase('Update')}} </button>
    </div>
</form>