<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasColumn('car_listings', 'Latitude')) {
            return;
        }

        Schema::table('car_listings', function (Blueprint $table) {
            if (!Schema::hasColumn('car_listings', 'latitude')) {
                $table->decimal('latitude', 10, 8)->nullable()->after('feature');
                $table->decimal('longitude', 11, 8)->nullable()->after('latitude');
            }
        });
    }

    public function down(): void
    {
        Schema::table('car_listings', function (Blueprint $table) {
            if (Schema::hasColumn('car_listings', 'latitude')) {
                $table->dropColumn(['latitude', 'longitude']);
            }
        });
    }
};
