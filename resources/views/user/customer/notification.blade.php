@extends('layouts.frontend')
@push('title', get_phrase('Notification'))
@push('meta')@endpush

@section('frontend_layout')

<style>
table {
  border-collapse: collapse;
  width: 100%;
}
tr{
  border:1px solid #ebebeb;
  border-radius:5px;	
  }

td, th {
  text-align: left;
  border-radius:5px;
  padding:5px;
}

.noti_heading{
    font-size: 15px;
    font-weight: 600;
    color: #000;
    margin: 0px;
}
.noti_pera{
    font-size: 13px;
    font-weight: 500;
    color: #000;
    margin: 0px;
}
.noti_read{
  font-weight:inherit!important;
}
.noti_read{
font-weight:inherit!important;
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
                  
                  <div class="d-flex align-items-start justify-content-between gap-2 mb-20px">
                        <div class="d-flex justify-content-between align-items-start gap-12px flex-column flex-lg-row w-100">
                            <h1 class="in-title-16px">My-Notifications</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb cap-breadcrumb">
                                  <li class="breadcrumb-item cap-breadcrumb-item"><a href="{{route('home')}}">{{get_phrase('Home')}}</a></li>
                                  <li class="breadcrumb-item cap-breadcrumb-item" aria-current="page">My-Notifications</li>
                                </ol>
                            </nav>
                        </div>
                        <button class="btn ca-menu-btn-primary d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#user-sidebar-offcanvas" aria-controls="user-sidebar-offcanvas">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21 5.25H3C2.59 5.25 2.25 4.91 2.25 4.5C2.25 4.09 2.59 3.75 3 3.75H21C21.41 3.75 21.75 4.09 21.75 4.5C21.75 4.91 21.41 5.25 21 5.25Z" fill="#242D47"></path>
                                <path d="M21 10.25H3C2.59 10.25 2.25 9.91 2.25 9.5C2.25 9.09 2.59 8.75 3 8.75H21C21.41 8.75 21.75 9.09 21.75 9.5C21.75 9.91 21.41 10.25 21 10.25Z" fill="#242D47"></path>
                                <path d="M21 15.25H3C2.59 15.25 2.25 14.91 2.25 14.5C2.25 14.09 2.59 13.75 3 13.75H21C21.41 13.75 21.75 14.09 21.75 14.5C21.75 14.91 21.41 15.25 21 15.25Z" fill="#242D47"></path>
                                <path d="M21 20.25H3C2.59 20.25 2.25 19.91 2.25 19.5C2.25 19.09 2.59 18.75 3 18.75H21C21.41 18.75 21.75 19.09 21.75 19.5C21.75 19.91 21.41 20.25 21 20.25Z" fill="#242D47"></path>
                            </svg>
                        </button>
                    </div>
                  
                  
                  <div class="ca-content-card table-responsive pb-1">
                    @if($noti->isEmpty())
            <p class="p-3 mb-0">No notifications found.</p>
        @else
                    <table class="mb-3">
                    @foreach($noti as $notification)
                      
                      <tr>
                        <td class="text-center"> @if($notification->media)
                                    <img src="{{ asset('uploads/notifications/' . $notification->media) }}" 
                                         alt="Notification Image" 
                                         class="rounded mr-3" 
                                         style="width: 40px; height: 40px; object-fit: cover;">
                                @else
                                    <!-- Default SVG -->
                                    <svg width="20" height="40" viewBox="0 0 24 24" fill="none" 
                                         xmlns="http://www.w3.org/2000/svg" class="mr-3">
                                        <path d="M12 2C10.3431 2 9 3.34315 9 5V6.26505C6.19124 7.15004 4.25 9.82885 4.25 13V17L3 18.25V19H21V18.25L19.75 17V13C19.75 9.82885 17.8088 7.15004 15 6.26505V5C15 3.34315 13.6569 2 12 2Z" 
                                              stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M14 21C14 22.1046 13.1046 23 12 23C10.8954 23 10 22.1046 10 21" 
                                              stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                @endif</td>
                        
                                      <td>
                                          <h5 @class(['noti_read' => $notification->read_on == 1, 'noti_heading' => true])>
                                              {{ $notification->title }}
                                          </h5>
                                      </td>
                                      <td>
                                          <p @class(['noti_read' => $notification->read_on == 1, 'noti_pera' => true])>
                                              {{ \Illuminate\Support\Str::limit($notification->displayDescription(), 50, '...') }}
                                          </p>
                                      </td>

                        
                           <td>
                           <a href="javascript:void(0);" 
   class="viewNotification" 
   data-id="{{ $notification->id }}" 
   data-title="{{ $notification->title }}"
   data-description="{{ $notification->displayDescription() }}"
   data-media="{{ $notification->media ? asset('uploads/notifications/'.$notification->media) : '' }}">
   <i class="fa fa-eye"></i>
</a>


                         </td>
                        
                         <td>
                          <a href="javascript:void(0);" class="deleteNotification" data-id="{{ $notification->id }}">
                          <i class="fa fa-trash"></i>
                          </a>
                         </td>

                       
                      </tr>
                     @endforeach
                    </table>
                    @endif
                  
                  </div>


                </div>
              </div>
          </div>
      </section>

<!-- Modal -->
<div class="modal fade" id="notificationModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 id="notificationModalLabel"></h5>
        <button type="button" class="close" id="closeNotificationModal">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img id="notificationImage"style="border-radius: 5px;width: 100%; display: none;margin-bottom:10px;">
        <p id="notificationDescription" style="background-color: #f1f1f1;padding: 10px;border-radius: 5px;"></p>        
      </div>
    </div>
  </div>
</div>

@endsection


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).on("click", "#closeNotificationModal", function () {
    $("#notificationModal").modal("hide");
});
</script>

<script>
$(document).on("click", ".viewNotification", function () {
    let id = $(this).data("id");
    let title = $(this).data("title");
    let description = $(this).data("description");
    let media = $(this).data("media");

    $("#notificationModalLabel").text(title);
    $("#notificationDescription").text(description);

    if (media) {
        $("#notificationImage").attr("src", media).show();
    } else {
        $("#notificationImage").hide();
    }

    if (id) {
        $.get("{{ route('customer.notification.read') }}", { id: id });
    }

    $("#notificationModal").modal("show");
});
</script>


<script>
$(document).on("click", ".deleteNotification", function () {
    let id = $(this).data("id");

    if (!confirm("Are you sure you want to delete this notification?")) {
        return;
    }

    $.ajax({
        url: "{{ route('customer.notification.delete') }}",
        type: "GET", // CSRF ignore kar rahe ho
        data: { id: id },
        success: function(res) {
            console.log(res);

            if (res.success) {
                // Remove the row from table
                $(".deleteNotification[data-id='"+id+"']").closest("tr").remove();
            } else {
                alert(res.message);
            }
        },
        error: function(xhr) {
            console.error("Error: ", xhr.responseText);
        }
    });
});
</script>

