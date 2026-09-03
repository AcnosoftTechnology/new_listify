<?php

namespace App\Exports;

use App\Models\Inventory;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class InventoryExport implements FromCollection, WithHeadings
{
    protected $listingId;
    protected $type;

    public function __construct($listingId, $type)
    {
        $this->listingId = $listingId;
        $this->type = $type;
    }

public function collection()
{
 return Inventory::with('category')
    ->where('listing_id', $this->listingId)
    ->where('type', $this->type)
    ->get()
    ->map(function ($item) {

        return [
            'name' => $item->name,
            'category' => $item->category->name ?? '',
            'price' => $item->price,
            'discount' => $item->discount_price,
            'description' => $item->description,
            'additional_info' => $item->additional_info,
            'availability' => $item->availability,
        ];

    });
}

    public function headings(): array
    {
        return [
            'Product Name',
            'Category',
            'Price',
            'Discount',
            'Description',
            'Additional Information',
            'Availability',
        ];
    }
}