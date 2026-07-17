<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notifications extends Model
{
    use HasFactory;

    protected $table = 'notifications'; 
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'media',
        'title',
        'description',
        'read_on',
        'status',
        'created_at',
    ];
  
  


}
