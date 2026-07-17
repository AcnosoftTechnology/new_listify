<?php

namespace App\Providers;

use App\Models\Appointment;
use App\Observers\AppointmentObserver;
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

        if ($appUrl = config('app.url')) {
            URL::forceRootUrl(rtrim($appUrl, '/'));
        }
    }
}
