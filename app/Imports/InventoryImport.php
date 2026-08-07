<?php

namespace App\Imports;

use App\Models\Inventory;
use App\Models\InventoryCategory;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class InventoryImport implements ToCollection
{
    protected $listingId;
    protected $type;

    public function __construct($listingId, $type)
    {
        $this->listingId = $listingId;
        $this->type = $type;
    }

    public function collection(Collection $rows)
    {
        unset($rows[0]);

        foreach ($rows as $row) {

            if (empty($row[0])) {
                continue;
            }

            $categoryName = trim($row[1]);

            $category = InventoryCategory::firstOrCreate(
                [
                    'listing_id' => $this->listingId,
                    'type' => $this->type,
                    'name' => $categoryName,
                ]
            );

            $price = (float) $row[2];
            $discount = (float) $row[3];

            $salePrice = $price;

            if ($discount > 0) {
                $salePrice = $price - (($price * $discount) / 100);
            }

            Inventory::updateOrCreate(

                [
                    'listing_id'  => $this->listingId,
                    'category_id' => $category->id,
                    'name'        => trim($row[0]),
                ],

                [
                    'type'            => $this->type,
                    'price'           => $price,
                    'discount_price'  => $discount,
                    'sale_price'      => $salePrice,
                    'description'     => trim($row[4]),
                    'additional_info' => trim($row[5]),
                    'availability'    => trim($row[6]),
                    'image'           => trim($row[7]),
                ]
            );
        }
    }
}