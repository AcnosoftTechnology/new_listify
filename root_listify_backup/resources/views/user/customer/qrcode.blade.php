@extends('layouts.frontend')
@push('title', get_phrase('Qrcode'))
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
                        
                        @if($Qrcode->isEmpty())
                      <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
                        <h4 class="title qr-title fs-16px">
                          <i class="fa fa-sliders"></i>
                          {{ get_phrase('Qrcodes') }}
                        </h4>

                            <a href="{{ route('customer.addqr') }}" class="btn ol-btn-outline-secondary d-flex align-items-center cg-10px">
                                <i class="fa fa-plus me-1"></i>
                                <span>{{ get_phrase('Add Qrcodes') }}</span>
                            </a>
                        

                      </div>
                      @endif
                    </div>
                    
                    <div class="ol-card radius-8px">
    <div class="ol-card ol-card-body my-2 py-20px px-20px p-3">
        <div class="">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Qrcode</th>
                        <th>Qrcode Name</th>
                        <th>UPI ID</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                 
                    @foreach($Qrcode as $qr)
                     
                     <tr>
                          
                       <!-- Image -->
<td>
    @if($qr->qrcode)


            {{-- Normal uploads folder se --}}
            <img src="{{ asset('uploads/qrcodes/' . $qr->qrcode) }}"
                 alt="Notification Image"
                 class="img-fluid rounded"
                 style="width: 100px; height: 100px; object-fit: cover;">
     

    @else
        <svg width="50" height="50" viewBox="0 0 24 24" fill="none"
             xmlns="http://www.w3.org/2000/svg"
             style="border:1px solid #ddd; border-radius:8px; padding:10px;">
            <path d="M12 2C10.3431 2 9 3.34315 9 5V6.26505C6.19124 7.15004 4.25 9.82885 4.25 13V17L3 18.25V19H21V18.25L19.75 17V13C19.75 9.82885 17.8088 7.15004 15 6.26505V5C15 3.34315 13.6569 2 12 2Z"
                  stroke="#99A1B7" stroke-width="1.4"
                  stroke-linecap="round" stroke-linejoin="round"></path>
            <path d="M14 21C14 22.1046 13.1046 23 12 23C10.8954 23 10 22.1046 10 21"
                  stroke="#99A1B7" stroke-width="1.4"
                  stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
    @endif
</td>

                            <!-- User ID -->
                            <td>{{ $qr->title ?? 'N/A' }}</td>
                       
                           <!-- UPI ID -->
                            <td>{{ $qr->upiid ?? 'N/A' }}</td>

                          
                            <!-- status -->
                            <td>
                              @if($qr->status == 1)
                              <button class="btn btn-success">Active</button>
                              @else
                              <button class="btn btn-danger">Inactive</button>
                              @endif
                            </td>


                            <!-- Edit Button -->
                            <td>
                              <a href="{{ route('customer.qrcode.editqr', $qr->id) }}" class="btn btn-sm btn-primary">
                                  <i class="fas fa-edit"></i> 
                              </a>
                                                          <!-- Delete button -->
  <form action="{{ route('customer.qrcode.destroy', $qr->id) }}" method="POST" style="display:inline-block;">
      @csrf
      @method('DELETE')
      <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this QR code?');">
          <i class="fas fa-trash"></i>
      </button>
  </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
                    
                    
                    
                  </div>
              </div>
          </div>
         </div> 
     </section>

@endsection