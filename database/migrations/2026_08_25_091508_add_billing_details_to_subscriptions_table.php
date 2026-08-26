<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
     public function up()
    {
        Schema::table('subscriptions', function (Blueprint $table) {

            $table->string('billing_name')->nullable()->after('user_id');
            $table->string('billing_email')->nullable()->after('billing_name');
            $table->string('billing_phone')->nullable()->after('billing_email');

            $table->text('billing_address')->nullable()->after('billing_phone');

            $table->string('billing_city')->nullable()->after('billing_address');
            $table->string('billing_state')->nullable()->after('billing_city');
            $table->string('billing_country')->nullable()->after('billing_state');
            $table->string('billing_pincode')->nullable()->after('billing_country');

            $table->boolean('has_gst')->default(0)->after('billing_pincode');
            $table->string('gst_number')->nullable()->after('has_gst');

        });
    }

    public function down()
    {
        Schema::table('subscriptions', function (Blueprint $table) {

            $table->dropColumn([
                'billing_name',
                'billing_email',
                'billing_phone',
                'billing_address',
                'billing_city',
                'billing_state',
                'billing_country',
                'billing_pincode',
                'has_gst',
                'gst_number',
            ]);

        });
    }
};
