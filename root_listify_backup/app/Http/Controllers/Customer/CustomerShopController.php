<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;

use App\Models\InventoryCategory;
use App\Models\Invoice;
use App\Models\Inventory;
use App\Models\InventoryPurchase;
use Illuminate\Support\Facades\Session;
use Barryvdh\DomPDF\Facade\Pdf;

use Illuminate\Http\Request;

class CustomerShopController extends Controller
{
    public function CustomerOrder(){
   
        $page_data['myOrders'] = InventoryPurchase::where('user_id', auth()->user()->id)->orderBy('created_at', 'desc')->paginate(10);
        $page_data['active'] = 'order';
        return view('user.shop.my_order', $page_data);
    }

    
    public function CustomerOrderDelete($id){
        $delete = InventoryPurchase::where('id',$id)->first();
        $delete->delete();
        Session::flash('success', get_phrase('Order Delete Successful!'));
        return redirect()->back();
    }


    public function invoiceDownload($id)
    {
        $invoice = InventoryPurchase::findOrFail($id);

        $policies = Invoice::where('user_id', $invoice->listing_creator_id)->first();


        $page_data['invoice'] = $invoice;
        $page_data['policies'] = $policies;

        $pdf = Pdf::setOptions(['isHtml5ParserEnabled' => true,'isRemoteEnabled' => true,])->loadView('user.shop.invoice', $page_data);
        return $pdf->download('invoice_' . $invoice->id . '.pdf');
    }

}
