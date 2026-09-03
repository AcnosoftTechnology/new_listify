<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InventoryPurchase extends Model
{
    use HasFactory;

   
    protected $fillable = [
        'id',
        'user_id ',
        'type',
        'listing_id',
        'product',
        'customer_name',
        'customer_email',
        'customer_phone',
        'customer_address',
        'customer_message',
        'amount',
        'listing_creator_id',
        'delivery_status',  
        'payment_status',
        'created_at',
        'updated_at'
      
    ];
}
