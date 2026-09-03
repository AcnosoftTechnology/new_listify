<?php


namespace App\Http\Controllers\Admin;



use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use App\Models\InventoryCategory;
use App\Models\Inventory;
use App\Models\InventoryPurchase;

use App\Models\BeautyListing;
use App\Models\CarListing;
use App\Models\HotelListing;
use App\Models\RealEstateListing;
use App\Models\RestaurantListing;

use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

use Barryvdh\DomPDF\Facade\Pdf;

class ShopController extends Controller
{
    public function order_manager() {
        $page_data['DeliveryOrders'] = InventoryPurchase::where('listing_creator_id', auth()->user()->id)
        ->where('delivery_status', 'delivered')
        ->where('payment_status', 'paid')
        ->orderBy('created_at', 'desc')
        ->get();
    
    $page_data['pendingOrders'] = InventoryPurchase::where('listing_creator_id', auth()->user()->id)
        ->where('delivery_status', 'pending')
        ->orderBy('created_at', 'desc') 
        ->get();
    
        return view('admin.shop.order_manager',$page_data);
    }
    
    public function myShopOrder(){
        $page_data['myOrders'] = InventoryPurchase::where('user_id', auth()->user()->id)->orderBy('updated_at', 'desc')->get();
        return view('admin.shop.my_order',$page_data);
    }

    public function orderShopDelete($id){
        $delete = InventoryPurchase::where('id',$id)->first();
        $delete->delete();
        Session::flash('success', get_phrase('Order Delete Successful!'));
        return redirect()->back();
    }

  
    public function inventroy_create($type,  $listing_id=""){
        $page_data['type'] = $type;
        $page_data['listing_id'] = $listing_id;
        return view('admin.shop.inventory_create', $page_data);
    }
    
    public function category_create( $type, $listing_id=""){
        $page_data['type'] = $type;
        $page_data['listing_id'] = $listing_id;
        return view('admin.shop.category_create', $page_data);
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
        return view('admin.shop.category_edit', $page_data);
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
             'description' => 'required|max:73',
            'image' => 'required',
            'category_id' => 'required',
            'availability' => 'required',
        ]);
        if (strlen($request->description) > 73) {
            return back()->with('error', get_phrase('Description must not exceed 73 characters.'));
        }
        $data = $request->all();
        $data = $request->except('_token');
        $date['name'] = $request->name;
        $date['type'] = $request->type;
        $date['category_id'] = $request->category_id;
        $date['description'] = $request->description;
        $date['price'] = $request->price;
        $date['listing_id'] = $request->listing_id;
        $date['availability'] = $request->availability;
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
        return view('admin.shop.inventory_edit', $page_data);
    }


    public function inventory_update(Request $request, $id){

        $validated = $request->validate([
            'name' => 'required|max:255',
            'price' => 'required|numeric',
            'description' => 'required|max:73',
            'category_id' => 'required',
            'availability' => 'required',
        ]);
        if (strlen($request->description) > 73) {
            return back()->with('error', get_phrase('Description must not exceed 73 characters.'));
        }
        $inventoryUpdate =  Inventory::where('id', $id);

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('uploads/inventory'), $imageName);
            $data['image'] = $imageName;
            $inventory = Inventory::where('id', $id)->first();
            if ($inventory && $inventory->image && is_file(public_path('uploads/inventory/'.$inventory->image))) {
                unlink(public_path('uploads/inventory/'.$inventory->image));
            }
        }

        $data['name'] = $request->name;
       
        $data['category_id'] = $request->category_id;
        $data['price'] = $request->price;
        $data['description'] = $request->description;
        $data['availability'] = $request->availability;
       
        $inventoryUpdate->update($data);
        
        Session::flash('success', get_phrase('Inventory  Updated Successful!'));
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
    


    public function invoiceDownload($id)
    {
        $invoice = InventoryPurchase::findOrFail($id);
        $page_data['invoice'] = $invoice;
    
        $pdf = Pdf::loadView('admin.shop.invoice', $page_data);
        return $pdf->download('invoice_' . $invoice->id . '.pdf');
    }




}
