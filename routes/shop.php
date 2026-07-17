<?php


use App\Http\Controllers\Admin\ShopController;
use App\Http\Controllers\Agent\AgentShopController;
use App\Http\Controllers\Frontend\FrontendShopController;
use App\Http\Controllers\Customer\CustomerShopController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;



Route::prefix('admin')->middleware(['auth', 'anyAuth'])->group(function () {
  Route::get('order-manager', [ShopController::class, 'order_manager'])->name('admin.order.manager'); 
  Route::get('inventory-myorder', [ShopController::class, 'myShopOrder'])->name('admin.inventory.myorder'); 
  Route::get('order-shop-delete/{id}', [ShopController::class, 'orderShopDelete'])->name('admin.order.shop.delete'); 
  Route::get('shop/paid/{id}', [ShopController::class, 'shopPaid'])->name('admin.shop.paid'); 
  Route::get('shop/delivered/{id}', [ShopController::class, 'shopDelivered'])->name('admin.shop.delivered'); 


  Route::get('inventory-create/{type}/{listing_id}', [ShopController::class, 'inventroy_create'])->name('admin.inventory.create'); 
  Route::post('inventory-store', [ShopController::class, 'inventroy_store'])->name('admin.inventory.store'); 
  Route::get('inventory-edit/{type}/{listing_id}/{inventory_id}', [ShopController::class, 'inventory_edit'])->name('admin.inventory.edit'); 
  Route::post('inventory/update/{id}', [ShopController::class, 'inventory_update'])->name('admin.inventory.update'); 
  Route::get('inventory/delete/{id}', [ShopController::class, 'inventory_delete'])->name('admin.inventory.delete'); 

  
  Route::get('inventory-category/create/{type}/{listing_id}', [ShopController::class, 'category_create'])->name('admin.inventory.category.create'); 
  Route::post('inventory-category/store', [ShopController::class, 'category_store'])->name('admin.inventory.category.store'); 
  Route::get('inventory-category/edit/{id}', [ShopController::class, 'category_edit'])->name('admin.inventory.category.edit'); 
  Route::post('inventory-category/update/{id}', [ShopController::class, 'category_update'])->name('admin.inventory.category.update'); 
  Route::get('inventory-category/delete/{id}', [ShopController::class, 'category_delete'])->name('admin.inventory.category.delete'); 

  Route::get('invoice/download/{id}', [ShopController::class, 'invoiceDownload'])->name('admin.invoice.download'); 

});

Route::prefix('agent')->middleware(['auth', 'anyAuth'])->group(function () {

  Route::get('inventory-create/{type}/{listing_id}', [AgentShopController::class, 'inventroy_create'])->name('agent.inventory.create'); 
  Route::post('inventory-store', [AgentShopController::class, 'inventroy_store'])->name('agent.inventory.store'); 
  Route::get('inventory-edit/{type}/{listing_id}/{inventory_id}', [AgentShopController::class, 'inventory_edit'])->name('agent.inventory.edit'); 
  Route::post('inventory/update/{id}', [AgentShopController::class, 'inventory_update'])->name('agent.inventory.update'); 
  Route::get('inventory/delete/{id}', [AgentShopController::class, 'inventory_delete'])->name('agent.inventory.delete'); 

  
  Route::get('inventory-category/create/{type}/{listing_id}', [AgentShopController::class, 'category_create'])->name('agent.inventory.category.create'); 
  Route::post('inventory-category/store', [AgentShopController::class, 'category_store'])->name('agent.inventory.category.store'); 
  Route::get('inventory-category/edit/{id}', [AgentShopController::class, 'category_edit'])->name('agent.inventory.category.edit'); 
  Route::post('inventory-category/update/{id}', [AgentShopController::class, 'category_update'])->name('agent.inventory.category.update'); 
  Route::get('inventory-category/delete/{id}', [AgentShopController::class, 'category_delete'])->name('agent.inventory.category.delete'); 


  Route::get('/order-manager', [AgentShopController::class, 'order_manager'])->name('agent.order.manager'); 
  Route::get('/order-delivery', [AgentShopController::class, 'order_delivery'])->name('agent.order.delivery'); 

  Route::get('agent/order-shop-delete/{id}', [AgentShopController::class, 'orderShopDelete'])->name('agent.order.delete'); 
  Route::get('agent/shop/paid/{id}', [AgentShopController::class, 'shopPaid'])->name('agent.shop.paid'); 
  Route::get('agent/shop/delivered/{id}', [AgentShopController::class, 'shopDelivered'])->name('agent.shop.delivered'); 

  Route::get('inventory/filter', [AgentShopController::class, 'inventoryFilter'])->name('agent.inventoryFilter'); 

  Route::get('agent/shop/unpaid/{id}', [AgentShopController::class, 'shopUnPaid'])->name('agent.shop.unpaid'); 
});


Route::controller(CustomerShopController::class)->middleware('auth', 'customer')->group(function () {
  Route::get('/customer/order', 'CustomerOrder')->name('customer.order');
  Route::get('/customer/order/delete/{id}', 'CustomerOrderDelete')->name('customer.order.delete');
  Route::get('/invoice/download/{id}', 'invoiceDownload')->name('customer.invoice.download'); 

});


Route::get('/shop/filter', [FrontendShopController::class, 'filterShopItems'])->name('shop.filter');
Route::get('/shop_details/{type}/{id}', [FrontendShopController::class, 'shopDetails'])->name('shopDetails');
Route::post('/store-selected-items', [FrontendShopController::class, 'storeSelectedItems'])->name('storeSelectedItems');
Route::post('/inventory/order', [FrontendShopController::class, 'inventoryOrder'])->name('inventory.order');
