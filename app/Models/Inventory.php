<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
   
    public $timestamps = true;

    protected $fillable = [
        'listing_id',
        'category_id',
        'type',
        'name',
        'price',
        'discount_price',
        'sale_price',
        'description',
        'additional_info',
        'availability',
        'icon_data',
        'image',
    ];
}
