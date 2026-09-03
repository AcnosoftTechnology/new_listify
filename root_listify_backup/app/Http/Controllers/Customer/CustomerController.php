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
use App\Services\FirebaseNotificationService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Log;

class CustomerController extends Controller{

      // Invoice list
      public function invoice(){
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

    function user_messages($prefix = "", $id = "", $code = "")
    {
        $page_data['active'] = 'message';
        $page_data['messages'] = collect();
        $page_data['thread_details'] = null;
        $uid = user('id');

        if ($id) {
            if ($code) {
                $thread = Message_thread::where('message_thread_code', $code)
                    ->where(function ($q) use ($uid) {
                        $q->where('sender', $uid)->orWhere('receiver', $uid);
                    })
                    ->first();
            } else {
                $thread = Message_thread::where(function ($q) use ($uid, $id) {
                    $q->where(function ($q2) use ($uid, $id) {
                        $q2->where('sender', $uid)->where('receiver', $id);
                    })->orWhere(function ($q2) use ($uid, $id) {
                        $q2->where('sender', $id)->where('receiver', $uid);
                    });
                })->first();

                if (!$thread) {
                    $thread = new Message_thread();
                    $thread->message_thread_code = $this->generateUniqueCode();
                    $thread->sender = $uid;
                    $thread->receiver = $id;
                    $thread->created_at = Carbon::now();
                    $thread->updated_at = Carbon::now();
                    $thread->save();
                }
            }

            $page_data['thread_details'] = $thread;
            $page_data['code'] = $thread ? $thread->message_thread_code : '';
            $page_data['messages'] = $thread
                ? Message::where('message_thread_code', $thread->message_thread_code)->orderBy('message_id')->get()
                : collect();
        } else {
            $page_data['code'] = '';
        }

        // Opening Messages tab marks all received unread as read (clears counter)
        $threadCodes = Message_thread::where('sender', $uid)
            ->orWhere('receiver', $uid)
            ->pluck('message_thread_code');

        if ($threadCodes->isNotEmpty()) {
            Message::whereIn('message_thread_code', $threadCodes)
                ->where('sender', '!=', $uid)
                ->where('read_status', 0)
                ->update(['read_status' => 1]);
        }

        $page_data['all_threads'] = Message_thread::where('sender', $uid)
            ->orWhere('receiver', $uid)
            ->orderByDesc('updated_at')
            ->get();

        return view('user.message.index', $page_data);
    }

    public function send_message(Request $request, $prefix, $code)
{
    $request->validate([
        'message' => 'nullable|string|max:5000',
        'attachment' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:5120',
    ]);

    $uid = user('id');

    $thread = Message_thread::where('message_thread_code', $code)
        ->where(function ($q) use ($uid) {
            $q->where('sender', $uid)->orWhere('receiver', $uid);
        })
        ->first();

    if (!$thread) {
        return redirect()->back()->with('error', get_phrase('Conversation not found'));
    }

    $messageText = sanitize($request->message);

    /*
    |--------------------------------------------------------------------------
    | IMAGE UPLOAD LOGIC
    |--------------------------------------------------------------------------
    */

    $imagePath = null;

    if ($request->hasFile('attachment')) {

        $image = $request->file('attachment');

        $fileName = time() . '_' . uniqid() . '.' . $image->getClientOriginalExtension();

        $destinationPath = public_path('uploads/chat');

        if (!file_exists($destinationPath)) {
            mkdir($destinationPath, 0777, true);
        }

        $image->move($destinationPath, $fileName);

        $imagePath = 'uploads/chat/' . $fileName;
    }

    if (empty($messageText) && empty($imagePath)) {
        return redirect()->back()->with(
            'error',
            get_phrase('Message or image is required')
        );
    }

    Message::insert([
        'message_thread_code' => $code,
        'message' => !empty($imagePath) ? $imagePath : $messageText,
        'sender' => $uid,
        'read_status' => 0,
        'created_at' => Carbon::now(),
        'updated_at' => Carbon::now(),
    ]);

    $thread->updated_at = Carbon::now();
    $thread->save();

    // Push to the other party (vendor ↔ customer)
    try {

        $receiverId = ((int) $thread->sender === (int) $uid)
            ? (int) $thread->receiver
            : (int) $thread->sender;

        $pushMessage = !empty($imagePath)
            ? '📷 Image'
            : $messageText;

        $pushOk = app(FirebaseNotificationService::class)->notifyChatMessage(
            (int) $uid,
            $receiverId,
            (string) $pushMessage,
            (string) $code
        );

        Log::info('Chat push after send_message', [
            'from' => (int) $uid,
            'to' => $receiverId,
            'thread' => $code,
            'sent' => $pushOk,
        ]);

    } catch (\Throwable $e) {
        Log::warning('Chat push failed: ' . $e->getMessage());
    }

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
           $noti = Notifications::where('user_id', (string) Auth::id())->orderByDesc('id')->get();
          $page_data['active'] = 'Notifications';
          return view('user.customer.notification', compact('noti'),$page_data);
      }

    public function notificationUnreadCount()
    {
        $count = Notifications::where('user_id', (string) auth()->id())
            ->whereIn('read_on', [0, '0'])
            ->count();

        return response()->json([
            'success' => true,
            'count' => $count,
        ]);
    }

    public function notificationRecentFeed()
    {
        $uid = (string) auth()->id();

        $rows = Notifications::where('user_id', $uid)
            ->whereIn('read_on', [0, '0'])
            ->orderByDesc('id')
            ->take(5)
            ->get();

        $items = $rows->map(function ($notification) {
            return [
                'id' => (int) $notification->id,
                'title' => (string) $notification->title,
                'href' => $this->notificationClickUrl($notification),
            ];
        })->values();

        return response()->json([
            'success' => true,
            'count' => Notifications::where('user_id', $uid)->whereIn('read_on', [0, '0'])->count(),
            'items' => $items,
        ]);
    }

    protected function notificationClickUrl(Notifications $notification): string
    {
        return $notification->clickActionUrl(route('customer.notification'));
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

    if ((string) $notification->user_id !== (string) auth()->id()) {
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

    if ((string) $notification->user_id !== (string) auth()->id()) {
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
  


public function storeqrcode(Request $request)
{
    $request->validate([
        'title'  => 'required|string|max:250',
        'upiid'  => 'required|string|max:250',
        'status' => 'required|in:0,1',
        'qrcode' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
    ]);

    $qrcode = Qrcode::find(1);

    $mediaPath = $qrcode ? $qrcode->qrcode : null;

    if ($request->hasFile('qrcode')) {

        // Purani image delete
        if ($qrcode && $qrcode->qrcode && file_exists(public_path('uploads/qrcodes/' . $qrcode->qrcode))) {
            unlink(public_path('uploads/qrcodes/' . $qrcode->qrcode));
        }

        $image = $request->file('qrcode');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/qrcodes'), $imageName);

        $mediaPath = $imageName;
    }

    Qrcode::updateOrCreate(
        ['id' => 1],
        [
            'user_id' => Auth::id(),
            'qrcode'  => $mediaPath,
            'title'   => $request->title,
            'upiid'   => $request->upiid,
            'status'  => $request->status,
        ]
    );

    Toastr::success('QR Code saved successfully!');
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

 
 public function updateqrcode(Request $request, $id)
{
    $request->validate([
        'title'  => 'required|string|max:250',
        'upiid'  => 'required|string|max:250',
        'status' => 'required|in:0,1',
        'qrcode' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
    ]);

    $qrcode = Qrcode::findOrFail($id);

    $qrcode->title = $request->title;
    $qrcode->upiid = $request->upiid;
    $qrcode->status = $request->status;

    if ($request->hasFile('qrcode')) {

        // Purani image delete
        if ($qrcode->qrcode && file_exists(public_path('uploads/qrcodes/' . $qrcode->qrcode))) {
            unlink(public_path('uploads/qrcodes/' . $qrcode->qrcode));
        }

        $image = $request->file('qrcode');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
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

