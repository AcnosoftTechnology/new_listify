<?php

namespace App\Http\Controllers\Agent;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\InventoryCategory;
use App\Models\InventoryPurchase;
use App\Models\Inventory;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AgentShopController extends Controller
{
    
    public function inventroy_manager(){
        return view('user.shop.inventory_manager');
    }

    public function inventroy_category(){
        return view('user.shop.category');
    }

  
    public function inventroy_create($type,  $listing_id=""){
        $page_data['type'] = $type;
        $page_data['listing_id'] = $listing_id;
        return view('user.shop.inventory_create', $page_data);
    }
    
    public function category_create( $type, $listing_id=""){
        $page_data['type'] = $type;
        $page_data['listing_id'] = $listing_id;
        return view('user.shop.category_create', $page_data);
    }

    public function category_store(Request $request){
        $validated = $request->validate([
            'name' => 'required|max:255',
        ]);
       $data = $request->all();
       $date['name'] = $request->name;
       $date['type'] = $request->type;
       $date['listing_id'] = $request->listing_id;
       $data = $request->except('_token');
       $data['created_at'] = Carbon::now();
       $data['updated_at'] = Carbon::now();
       InventoryCategory::insert($data);
       Session::flash('success', get_phrase('Inventory Category Created Successful!'));
       return redirect()->back();
    }


    public function category_edit( $id){
        $page_data['inventory_category'] =InventoryCategory::find($id); 
        return view('user.shop.category_edit', $page_data);
    }

    public function category_update(Request $request, $id){
        $inventory =  InventoryCategory::where('id', $id);
        $data['name'] = $request->name;
        $inventory->update($data);
        Session::flash('success', get_phrase('Inventory Category  Updated Successful!'));
        return redirect()->back();
    }
   
    public function category_delete($id){
        $delete = InventoryCategory::where('id',$id)->first();
        $delete->delete();
        Session::flash('success', get_phrase('Inventory Category  Delete Successful!'));
        return redirect()->back();

    }

    // Inventory Store
    public function inventroy_store(Request $request){
        $validated = $request->validate([
            'name' => 'required|max:255',
            'price' => 'required|numeric',
            'discount_price' => 'required|numeric',
            'description' => 'required|string',
            'additional_info' => 'required|string',
            'category_id' => 'required',
            'image' => 'required',
            'availability' => 'required',
        ]);
        //if (strlen($request->description) > 73) {
            //return back()->with('error', get_phrase('Description must not exceed 73 characters.'));
        //}
        $data = $request->all();
        $data = $request->except('_token');
        $date['name'] = $request->name;
        $date['type'] = $request->type;
        $date['category_id'] = $request->category_id;
        $date['description'] = $request->description;
        $date['additional_info'] = $request->additional_info;
        $date['price'] = $request->price;
        $data['discount_price'] = $request->discount_price;
        $date['listing_id'] = $request->listing_id;
        $date['availability'] = $request->availability;      
      
        // ✅ Remove extra fields
        $data = $request->except('_token', 'icon', 'icon_title');

        $data['sale_price'] = (!empty($request->discount_price) && $request->discount_price > 0)
        ? $request->price - ($request->price * $request->discount_price / 100)
        : $request->price;
      
        // ✅ Special Features JSON
        $icons = $request->icon ?? [];
        $titles = $request->icon_title ?? [];
        $features = [];

        foreach ($icons as $index => $icon) {
          $features[] = [
            'icon'  => $icon,
            'title' => $titles[$index] ?? ''
          ];
        }

        $data['icon_data'] = json_encode($features);
      
      
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('uploads/inventory'), $imageName);
            $data['image'] = $imageName;
        }
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        Inventory::insert($data);
        Session::flash('success', get_phrase('Inventory Created Successful!'));
        return redirect()->back();


    }

    public function inventory_delete($id){
        $delete = Inventory::where('id',$id)->first();
        if (is_file('public/uploads/inventory/' . $delete->image)) {
            unlink('public/uploads/inventory/' . $delete->image);
        }
        $delete->delete();
        Session::flash('success', get_phrase('Inventory  Delete Successful!'));
        return redirect()->back();
    }

    public function inventory_edit(  $type, $listing_id, $inventory_id){
        $page_data['type'] = $type;
        $page_data['listing_id'] = $listing_id;
        $page_data['inventory'] =Inventory::find($inventory_id); 
        return view('user.shop.inventory_edit', $page_data);
    }


public function inventory_update(Request $request, $id){
    $validated = $request->validate([
        'name' => 'required|max:255',
        'price' => 'required|numeric',
        'discount_price' => 'required|numeric',
        'description' => 'required|string',
        'additional_info' => 'required|string',
        'category_id' => 'required',
        'availability' => 'required',
    ]);

    $inventory = Inventory::findOrFail($id);
    $data = $request->except('_token', 'icon', 'icon_title', 'image'); // remove unwanted fields

    // ✅ Image replace logic
    if ($request->hasFile('image')) {
        $image = $request->file('image');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/inventory'), $imageName);
        $data['image'] = $imageName;

        // Old image delete
        if ($inventory->image && is_file(public_path('uploads/inventory/'.$inventory->image))) {
            unlink(public_path('uploads/inventory/'.$inventory->image));
        }
    }

    // ✅ Sale Price Calculation
    if (!empty($request->discount_price) && $request->discount_price > 0) {
        $discountPercent   = $request->discount_price;
        $salePrice         = $request->price - ($request->price * $discountPercent / 100);
        $data['sale_price']= $salePrice;
    } else {
        $data['sale_price']= $request->price;
    }

    // ✅ Special Features JSON
    $icons   = $request->icon ?? [];
    $titles  = $request->icon_title ?? [];
    $features = [];

    foreach ($icons as $index => $icon) {
        $features[] = [
            'icon'  => $icon,
            'title' => $titles[$index] ?? ''
        ];
    }

    $data['icon_data'] = json_encode($features);

    // ✅ Update DB
    $data['updated_at'] = Carbon::now();
    $inventory->update($data);

    Session::flash('success', get_phrase('Inventory Updated Successful!'));
    return redirect()->back();
}


    public function order_manager() {
        $page_data['active'] = 'order_manager';
        $page_data['pendingOrders'] = InventoryPurchase::where('listing_creator_id', auth()->user()->id)->where('delivery_status', 'pending')->orderBy('created_at', 'desc')->paginate(10);
        return view('user.shop.order_manager',$page_data);
    }
    public function order_delivery() {
        $page_data['active'] = 'order_delivery';
        $page_data['deliveryOrders'] = InventoryPurchase::where('listing_creator_id', auth()->user()->id)->where('delivery_status', 'delivered')->where('payment_status', 'paid')->orderBy('created_at', 'desc')->paginate(10);
        return view('user.shop.order_delivery',$page_data);
    }

    public function orderShopDelete($id){
        $delete = InventoryPurchase::where('id',$id)->first();
        $delete->delete();
        Session::flash('success', get_phrase('Order Delete Successful!'));
        return redirect()->back();
    }

    public function shopPaid($id){
        InventoryPurchase::where('id', $id)->update([
            'payment_status' => 'paid'
        ]);
        Session::flash('success', get_phrase('Order has been marked as paid.'));
        return redirect()->back();
    }

    public function shopDelivered($id){
        $order = InventoryPurchase::find($id);
        if ($order && $order->payment_status != 'paid') {
            Session::flash('error', get_phrase('Please mark the payment as Paid before delivering.'));
            return redirect()->back();
        }
        $order->update([
            'delivery_status' => 'delivered',
            'updated_at' => now()
        ]);
        Session::flash('success', get_phrase('Order has been marked as Delivered.'));
        return redirect()->back();
    }


    public function shopUnPaid($id){
        InventoryPurchase::where('id', $id)->update([
            'payment_status' => 'pending'
        ]);
        Session::flash('success', get_phrase('Order has been marked as Unpaid.'));
        return redirect()->back();
    }


    public function inventoryFilter(Request $request){
        $userId = auth()->user()->id;
        $page_data['active'] = 'agent_listing';
        $query = InventoryPurchase::where('listing_creator_id', $userId);
    
        if ($request->status) {
            $query->where('payment_status', $request->status)->where('delivery_status', 'pending');
        }    
        $page_data['pendingOrders'] = $query->orderBy('created_at', 'desc')->paginate(10);
    
        return view('user.shop.order_manager', $page_data);
    }






}
