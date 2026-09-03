use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;



//Table structure for table `inventories`
if(!Schema::hasTable('inventories'))
{
    Schema::create('inventories', function (Blueprint $table) {
        $table->id();
        $table->integer('listing_id')->nullable();
        $table->integer('category_id')->nullable();
        $table->string('type', 255)->nullable();
        $table->string('name', 255)->nullable();
        $table->string('price', 255)->nullable();
        $table->longtext('description')->nullable();
        $table->integer('availability')->nullable();
        $table->string('image', 255)->nullable();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
    });
}

//Table structure for table `inventory_categories`
if(!Schema::hasTable('inventory_categories'))
{
    Schema::create('inventory_categories', function (Blueprint $table) {
        $table->id();
        $table->string('type', 255)->nullable();
        $table->integer('listing_id')->nullable();
        $table->string('name', 255)->nullable();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
    });
}


//Table structure for table `inventory_purchases`
if(!Schema::hasTable('inventory_purchases'))
{
    Schema::create('inventory_purchases', function (Blueprint $table) {
        $table->id();
        $table->integer('user_id')->nullable();
        $table->integer('listing_creator_id')->nullable();
        $table->string('type', 255)->nullable();
        $table->integer('listing_id')->nullable();
        $table->string('product', 255)->nullable();
        $table->string('customer_name', 255)->nullable();
        $table->string('customer_email', 255)->nullable();
        $table->string('customer_phone', 255)->nullable();
        $table->string('customer_address', 255)->nullable();
        $table->longtext('customer_message')->nullable();
        $table->string('amount', 255)->nullable();
        $table->string('payment_status', 255)->nullable();
        $table->string('delivery_status', 255)->nullable();
        $table->timestamp('created_at')->nullable();
        $table->timestamp('updated_at')->nullable();
    });
}

