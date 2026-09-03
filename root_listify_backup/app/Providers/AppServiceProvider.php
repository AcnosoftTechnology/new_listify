<?php

namespace App\Providers;

use App\Models\Appointment;
use App\Models\InventoryPurchase;
use App\Observers\AppointmentObserver;
use App\Observers\InventoryPurchaseObserver;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrap();
        Appointment::observe(AppointmentObserver::class);
        InventoryPurchase::observe(InventoryPurchaseObserver::class);

        if ($appUrl = config('app.url')) {
            URL::forceRootUrl(rtrim($appUrl, '/'));
        }
    }
}
