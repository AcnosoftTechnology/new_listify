<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Qrcode extends Model
{
    use HasFactory;

    protected $table = 'qrcode'; 
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'title',
        'upiid',
        'qrcode',        
        'status',
        'created_at',
    ];
  
  


}
