<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('hotel_listings', function (Blueprint $table) {
            if (!Schema::hasColumn('hotel_listings', 'Latitude')) {
                $table->string('country')->nullable()->after('feature');
                $table->string('city')->nullable()->after('country');
                $table->string('area')->nullable()->after('city');
                $table->string('address')->nullable()->after('area');
                $table->string('postal_code')->nullable()->after('address');
                $table->decimal('Latitude', 10, 8)->nullable()->after('postal_code');
                $table->decimal('Longitude', 11, 8)->nullable()->after('Latitude');
            }
        });
    }

    public function down(): void
    {
        Schema::table('hotel_listings', function (Blueprint $table) {
            if (Schema::hasColumn('hotel_listings', 'Latitude')) {
                $table->dropColumn(['country', 'city', 'area', 'address', 'postal_code', 'Latitude', 'Longitude']);
            }
        });
    }
};
