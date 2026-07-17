<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use App\Http\Controllers\Controller;
use App\Models\Notifications;
use App\Models\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Session;

class notificationController extends Controller{

public function index()
{
    $noti = Notifications::select('notifications.*', 'users.name as user_title')
        ->leftJoin('users', 'notifications.user_id', '=', 'users.id')
        ->orderBy('notifications.id', 'desc')
        ->paginate(10);

    return view('admin.notification.index', compact('noti'));
}

    public function create(){
       $users = User::select('id', 'name')->get(); 
        return view('admin.notification.create',compact('users'));
    }
  
  
public function store(Request $request){
    $request->validate([
        'title' => 'required|string|max:250',
        'description' => 'required|string',
        'user_id' => 'required|array',
        'status' => 'required|in:0,1'
    ]);

    if ($request->hasFile('media')) {
        $image = $request->file('media');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/notifications'), $imageName);
        $mediaPath = $imageName; 
    }
  
    // Insert notification for multiple users
    foreach ($request->user_id as $userId) {
        \App\Models\Notifications::create([
            'user_id' => $userId,
            'media' => $mediaPath,
            'title' => $request->title,
            'description' => $request->description,
            'status' => $request->status,
            'created_at' => now(),
        ]);
    }

    // Success message
    Toastr::success('Notification added successfully!');
    return redirect()->route('admin.notification');
}
  
  
  
public function edit($id){
  
    $users = User::select('id', 'name')->get();
    $notification = Notifications::findOrFail($id);
    return view('admin.notification.edit', compact('notification', 'users'));
}
  

public function update(Request $request, $id){
    $request->validate([
        'title' => 'required|string|max:250',
        'description' => 'required|string',
        'user_id' => 'required|integer',
        'media' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        'status' => 'required|in:0,1'
    ]);

    // Fetch the notification
    $notification = \App\Models\Notifications::findOrFail($id);

    // Handle image upload if a new image is provided
    if ($request->hasFile('media')) {
        $image = $request->file('media');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $destinationPath = public_path('uploads/notifications');

        // Create directory if not exists
        if (!file_exists($destinationPath)) {
            mkdir($destinationPath, 0755, true);
        }

        // Move the new image
        $image->move($destinationPath, $imageName);

        // Optionally delete old image
        if ($notification->media && file_exists(public_path('uploads/notifications/' . $notification->media))) {
            unlink(public_path('uploads/notifications/' . $notification->media));
        }

        $notification->media = $imageName;
    }

    // Update other fields
    $notification->title = $request->title;
    $notification->description = $request->description;
    $notification->user_id = $request->user_id;
    $notification->status = $request->status;
    $notification->updated_at = now();

    $notification->save();

    \Log::info("Notification updated successfully: ID {$id}");

    Toastr::success('Notification updated successfully!');
    return redirect()->route('admin.notification');
}

  

  public function destroy($id){
    
    $notification = Notifications::findOrFail($id);
  
    if ($notification->media && file_exists(public_path('uploads/notifications/' . $notification->media))) {
        unlink(public_path('uploads/notifications/' . $notification->media));
    }

    $notification->delete();

    Toastr::success('Notification deleted successfully!');
    return redirect()->route('admin.notification');
}

  
  
  
  
}