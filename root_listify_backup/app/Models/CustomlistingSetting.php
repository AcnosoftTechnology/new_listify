<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomlistingSetting extends Model{
  
    use HasFactory; 
  
    protected $table = 'customlisting_setting'; 
    public $timestamps = false;
  
    protected $fillable = [
        'listing_type',
        'banner_title',
        'banner_description',
        'banner_bg_image',
        'banner_tab_name',
        'banner_tab_link',
        'cta_bg_image',
        'cta_bg_title',
        'cta_bg_description',
        'cta_tab_name',
        'cta_tab_link',
        'created_at',
    ];
  
}
