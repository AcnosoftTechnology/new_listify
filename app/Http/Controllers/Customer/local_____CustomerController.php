<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\Message;
use App\Models\Message_thread;
use App\Models\Pricing;
use App\Models\User;
use App\Models\Qrcode;
use App\Models\Notifications;
use App\Models\Invoice;
use App\Models\Wishlist;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;

class CustomerController extends Controller
{

      // Invoice list
public function invoice()
{
    $page_data['invoice'] = Invoice::where('user_id', user('id'))->first();
    $page_data['active'] = 'invoice';
    return view('user.customer.invoice.index', $page_data);
}

    // Create form
    public function createInvoice()
    {
        return view('user.customer.invoice.create');
    }

    // Store
    public function storeInvoice(Request $request)
    {
        $request->validate([
            'note' => 'nullable|string',
            'terms_condition' => 'nullable|string',
            'shipping' => 'nullable|string',
            'disclaimer' => 'nullable|string',
        ]);

        Invoice::create([
            'user_id' => user('id'),
            'note' => $request->note,
            'terms_condition' => $request->terms_condition,
            'shipping' => $request->shipping,
            'disclaimer' => $request->disclaimer,
        ]);

        return redirect()->route('customer.invoice')->with('success', 'Invoice created successfully!');
    }

    // Edit form
    public function editInvoice($id)
    {
        $invoice = Invoice::where('id', $id)->where('user_id', user('id'))->firstOrFail();
        return view('user.customer.invoice.edit', compact('invoice'));
    }

    // Update
    public function updateInvoice(Request $request, $id)
    {
        $request->validate([
            'note' => 'nullable|string',
            'terms_condition' => 'nullable|string',
            'shipping' => 'nullable|string',
            'disclaimer' => 'nullable|string',
        ]);

        $invoice = Invoice::where('id', $id)->where('user_id', user('id'))->firstOrFail();
        $invoice->update([
            'note' => $request->note,
            'terms_condition' => $request->terms_condition,
            'shipping' => $request->shipping,
            'disclaimer' => $request->disclaimer,
        ]);

        return redirect()->route('customer.invoice')->with('success', 'Invoice updated successfully!');
    }

    public function wishlist() 
    {
        $page_data['wishlists'] = Wishlist::where('user_id', user('id'))->paginate(10);
        $page_data['active'] = 'wishlist';
        return view('user.customer.wishlist', $page_data);
    }

    public function appointment() 
    {
        $page_data['active'] = 'userAppointment';
        $page_data['appointments'] = Appointment::where('customer_id', user('id'))->orderBy('created_at', 'desc')->paginate(10);
        return view('user.customer.appointment.index', $page_data);
    }

    public function become_an_agent()
    {
        $page_data['packages'] = Pricing::get();
        $page_data['active'] = 'become_an_agent';
        return view('user.customer.become_an_agent', $page_data);
    }

    function generateUniqueCode($length = 16) {
        // Generate random bytes
        $bytes = random_bytes($length / 2);
        // Convert to hexadecimal representation
        return bin2hex($bytes);
    }

    function user_messages($prefix = "", $id = "", $code = ""){

        $page_data['active'] = 'message';
        if ($id) {
            if($code){
                $threads = Message_thread::where('message_thread_code', $code);
                $page_data['messages'] = Message::where('message_thread_code', $code)->get();
            }else{
                if(user('is_agent')){
                    $threads = Message_thread::where('sender', user('id'))->Where('receiver', $id);
                }else{
                    $threads = Message_thread::where('sender', $id)->Where('receiver', user('id'));
                }
                $thread_code = $this->generateUniqueCode();
                if(!$threads->first()){
                
                    $thread['message_thread_code'] =  $thread_code;
                    $thread['sender'] = user('id');
                    $thread['receiver'] = $id;
                    $thread['created_at'] = Carbon::now();
                    $thread['updated_at'] = Carbon::now();
                    Message_thread::insert($thread);
                }
                $threads = Message_thread::where('message_thread_code', $thread_code);
                $page_data['messages'] = Message::where('message_thread_code', $thread_code)->get();
            }
            $page_data['thread_details'] = $threads->first();  
            $page_data['code'] = ($code == '' && !$code) ? $thread_details->message_thread_code : $code;
        }else{
            $page_data['code'] = '';
        }
        $page_data['all_threads'] = Message_thread::where('sender', user('id'))->orWhere('receiver', user('id'))->get();
        return view('user.message.index', $page_data);
    }
    public function send_message(Request $request, $prefix, $code) {
        $mes['message_thread_code'] = $code;
        $mes['message'] = sanitize($request->message);
        $mes['sender'] = user('id');
        $mes['read_status'] = 0;
        $mes['created_at'] = Carbon::now();
        $mes['updated_at'] = Carbon::now();
        Message::insert($mes);
        return redirect()->back();
    }

    public function remove_wishlist($id) {
        Wishlist::where('id', $id)->delete();
        return redirect()->back()->with('success', 'Wishlist delete successfully');
    }

    public function following_agent() {
        $page_data['active'] = 'following';
        return view('user.customer.following_agent', $page_data);
    }

    function following_agent_remove($id) {
        $user_details = json_decode(user('following_agent'), true);
        $newArray = array_filter($user_details, function($value) use ($id) {
            return $value !== $id;
        });
        $newArray = array_values($newArray);
        $data['following_agent'] = json_encode($newArray);
        User::where('id', user('id'))->update($data);
        return redirect()->back()->with('success', 'Remove successfully');
    }
  
  
      public function notification() {
           $noti = Notifications::where('user_id', Auth::id())->latest()->get();
          $page_data['active'] = 'Notifications';
          return view('user.customer.notification', compact('noti'),$page_data);
      }


  
     public function mycrm() {
       $page_data['active'] = 'mycrm';
        return view('user.customer.mycrm',$page_data);
      }

  
public function markAsRead(Request $request){
  
    $notification = Notifications::find($request->id);

    if (!$notification) {
        return response()->json([
            'success' => false,
            'message' => 'Notification not found'
        ]);
    }

    if ($notification->user_id != auth()->id()) {
        return response()->json([
            'success' => false,
            'message' => 'Not authorized'
        ]);
    }

    $notification->read_on = 1;  
    $notification->save();

    return response()->json([
        'success' => true,
        'message' => 'Notification marked as read'
    ]);
}
  


public function deleteNotification(Request $request){
  
    $notification = Notifications::find($request->id);

    if (!$notification) {
        return response()->json([
            'success' => false,
            'message' => 'Notification not found'
        ]);
    }

    if ($notification->user_id != auth()->id()) {
        return response()->json([
            'success' => false,
            'message' => 'Not authorized'
        ]);
    }

    $notification->delete();

    return response()->json([
        'success' => true,
        'message' => 'Notification deleted successfully'
    ]);
}
  
  
    
    public function qrcode() {
        $page_data['active'] = 'qrcode';
      
        $userId = Auth::id();
        $qrcode = Qrcode::where('user_id', $userId)->get();
        $page_data['Qrcode'] = $qrcode;  
      
        return view('user.customer.qrcode', $page_data);
    }
  
    public function addqrcode() {
        $page_data['active'] = 'addqr';
        return view('user.customer.addqr', $page_data);
    }
  


    public function storeqrcode(Request $request){
  
    $request->validate([
        'title' => 'required|string|max:250',       
        'status' => 'required|in:0,1',
        'qrcode' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
    ]);

    $mediaPath = null;

    if ($request->hasFile('qrcode')) {
        $image = $request->file('qrcode');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/qrcodes'), $imageName);
        $mediaPath = $imageName; 
    }
      
    Qrcode::create([
        'user_id' => Auth::id(),
        'qrcode'  => $mediaPath,
        'title'   => $request->title,
        'status'  => $request->status,
        'created_at' => now(),
    ]);

    Toastr::success('Qrcode added successfully!');
    return redirect()->route('customer.qrcode');
      
}
  

public function qredit($id){
    $page_data['active'] = 'editqr';
    $qredit = Qrcode::findOrFail($id);

    return view('user.customer.editqr', [
        'page_data' => $page_data,
        'active'    => $page_data['active'],
        'qredit'    => $qredit,
    ]);
}

 
  public function updateqrcode(Request $request, $id){
    
    $request->validate([
        'title'  => 'required|string|max:250',
        'status' => 'required|in:0,1',
    ]);

    $qrcode = Qrcode::findOrFail($id);

    $qrcode->title = $request->title;
    $qrcode->status = $request->status;

    if ($request->hasFile('qrcode')) {
        $image = $request->file('qrcode');
        $imageName = time().'.'.$image->getClientOriginalExtension();
        $image->move(public_path('uploads/qrcodes'), $imageName);
        $qrcode->qrcode = $imageName;
    }

    $qrcode->save();

    Toastr::success('QR Code updated successfully!');
    return redirect()->route('customer.qrcode');
}

  public function destroy($id)
{
    $qrcode = Qrcode::findOrFail($id);
    $qrcode->delete();

    return redirect()->back()->with('success', 'QR Code deleted successfully.');
}

  
  
  
  


  
    
}

