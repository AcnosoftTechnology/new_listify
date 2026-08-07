<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Imports\InventoryImport;
use Maatwebsite\Excel\Facades\Excel;

class InventoryController extends Controller
{
    public function importExcel(Request $request)
    {
        
        try {

            Excel::import(
                new InventoryImport(
                    $request->listing_id,
                    $request->type
                ),
                $request->file('excel')
            );

            return back()->with(
                'success',
                'Data imported successfully.'
            );

        } catch (\Exception $e) {

            dd($e->getMessage());
        }
    }
}