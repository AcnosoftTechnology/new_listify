@extends('layouts.frontend')
@push('title', get_phrase('addqr'))
@push('meta')@endpush

@section('frontend_layout')

<style>
.qrcode_list{
    box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
    border-radius: 8px;
    background-color: #fff;
  }
 .qr-title{
    font-weight: 600;
    color: #0a1017;
  }
  .ol-btn-outline-secondary{
    border: 1px solid #c3c9da;
    border-radius: 8px;
    padding: 9.5px 23px;
    font-weight: 500;
    font-size: 14px;
    letter-spacing: 0.01em;
    color: #0a1017;
    transition: .3s;
    width: max-content; 
  }
  .ol-btn-outline-secondary:hover {
    border-color: #1b84ff !important;
    color: #1b84ff !important;
}
</style>

    <!-- Start Main Area -->
    <section class="ca-wraper-main mb-90px mt-4">
        <div class="container">
            <div class="row gx-20px">
                <div class="col-lg-4 col-xl-3">
                    @include('user.navigation')
                </div>
                <div class="col-lg-8 col-xl-9">
                  <div class="ol-card qrcode_list radius-8px">
                    <div class="ol-card-body my-2 py-20px px-20px">
                      <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
                        <h4 class="title qr-title fs-16px">
                          <i class="fa fa-sliders"></i>
                          {{ get_phrase('Add Qrcode') }}
                        </h4>
                      </div>
                      
                      
                       <div class="ol-card ol-card-body my-2 py-20px px-20px p-3">
    
     <form action="{{ route('customer.storeqrcode') }}" method="post" enctype="multipart/form-data">
 @csrf
        <div class="row">
          
           <div class="col-sm-6 mb-3">
               <label for="title" class="form-label ol-form-label"> UPI Name </label>
               <input type="text" class="form-control ol-form-control" name="title" id="title" placeholder="Enter your title">
           </div>  
          
           <div class="col-sm-6 mb-3">
               <label for="title" class="form-label ol-form-label"> UPI ID </label>
               <input type="text" class="form-control ol-form-control" name="upiid" id="upiid" placeholder="Enter UPI ID">
           </div>  

         <div class="col-sm-6 mb-3">
           <label for="media" class="form-label ol-form-label">Upload Qrcode</label>
           <input type="file" class="form-control ol-form-control" name="qrcode" id="qrcode" accept="image/*">
        </div>

          
          <div class="col-sm-6 mb-3">
            <label for="status" class="form-label ol-form-label"> Status </label>
            <select class="form-control ol-form-control" name="status" id="status">
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
          </div>
          
          <div class="col-sm-12 mb-3">
          <button type="submit" class="btn ol-btn-primary fs-14px"> Add </button>
          </div>  

        </div>
      </form>
  </div>
                      
                      
                    </div>
                  </div>
              </div>
          </div>
         </div> 
     </section>

@endsection