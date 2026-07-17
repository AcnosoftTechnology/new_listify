<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\InventoryCategory;
use App\Models\InventoryPurchase;
use App\Models\Inventory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class FrontendShopController extends Controller
{
    
    public function filterShopItems(Request $request)
    {
        $categoryId = $request->input('category_id');
        $listingId = $request->input('listing_id'); 
        $shopItems = Inventory::where('listing_id', $listingId)->where('category_id', $categoryId)->get();
        if ($shopItems->isEmpty()) {
            return response()->json(['data' => []]);
        }
        $shopItemsFormatted = $shopItems->map(function($shop) {
            return [
                'name' => $shop->name,
                'product_id' => $shop->id,
                'image' => get_all_image('inventory/' . $shop->image),
                'price' => currency($shop->price),
                'description' => $shop->description
            ];
        });
    
        return response()->json(['data' => $shopItemsFormatted]);
    }

    public function shopDetails(Request $request , $type , $id){
        $page_data['type'] = $type;
        $page_data['listing_id'] = $id;
        $page_data['selectedItems'] = json_decode($request->get('items'), true);
        return view('frontend.shop_details', $page_data);
    }

    public function storeSelectedItems(Request $request){
       $request->session()->put('selectedItems', $request->items);
       return response()->json(['status' => 'success']);
    }


public function inventoryOrder(Request $request){
    $request->validate([
        'customer_name'    => 'required|string|max:255',
        'customer_phone' => 'required|numeric',
        'listing_creator_id'   => 'required|numeric',
        'customer_email'   => 'required|email',
        'customer_address' => 'required|string',
        'customer_message' => 'required|string',
        'payment_method'   => 'required|string|in:upi,cod',
        'txn_id'           => 'required_if:payment_method,upi',
        'product_ids'      => 'required|string', 
        'amount'           => 'required|numeric',
        'payment_image'    => 'required_if:payment_method,upi|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
    ]);

    $mediaPath = null;

    if ($request->hasFile('payment_image')) {
        $image = $request->file('payment_image');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('uploads/paymentscreenshort'), $imageName);
        $mediaPath = $imageName; 
    }

    if (!Auth::check()) {
        Session::flash('warning', get_phrase('Please Login First!'));
        return redirect()->back();
    }

    $userId = auth()->user()->id;

    if ($userId == $request->listing_creator_id) {
        Session::flash('warning', get_phrase("You can't Order your own product!"));
        return redirect()->back();
    }

    $inventory = new InventoryPurchase();
    $inventory->type                = $request->type;
    $inventory->listing_id          = $request->listing_id;
    $inventory->customer_name       = $request->customer_name;
    $inventory->customer_phone      = $request->customer_phone;
    $inventory->customer_email      = $request->customer_email;
    $inventory->customer_address    = $request->customer_address;
    $inventory->customer_message    = $request->customer_message;
    $inventory->payment_method      = $request->payment_method;
    $inventory->txn_id              = $request->txn_id;
    $inventory->product             = $request->product_ids;
    $inventory->amount              = $request->amount;
    $inventory->listing_creator_id  = $request->listing_creator_id;
    $inventory->payment_status      = 'pending'; 
    $inventory->delivery_status     = 'pending'; 
    $inventory->user_id             = $userId;

    if ($mediaPath) {
        $inventory->payment_image = $mediaPath;
    }

    $inventory->save();

    Session::flash('success', 'Your Order request has been submitted successfully.');
    return redirect()->back();
}
    
    

}
