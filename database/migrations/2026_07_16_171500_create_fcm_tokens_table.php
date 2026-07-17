<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('fcm_tokens')) {
            Schema::create('fcm_tokens', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('user_id')->index();
                // VARCHAR (not TEXT) so MySQL UNIQUE index works on live phpMyAdmin
                $table->string('token', 512);
                $table->string('device_label', 255)->nullable();
                $table->timestamps();
                $table->unique(['user_id', 'token'], 'fcm_tokens_user_token_unique');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('fcm_tokens');
    }
};
