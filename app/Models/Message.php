<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $table = 'messages';
    protected $primaryKey = 'message_id';

    protected $fillable = [
        'message_thread_code',
        'message',
        'sender',
        'read_status',
        'created_at',
        'updated_at',
    ];
}
