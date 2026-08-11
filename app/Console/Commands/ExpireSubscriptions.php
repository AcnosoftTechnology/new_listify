<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Subscription;
use Carbon\Carbon;

class ExpireSubscriptions extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:expire-subscriptions';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
public function handle()
{
    $expiredSubscriptions = Subscription::where('status', 1)
        ->whereNotNull('expire_date')
        ->where('expire_date', '<=', time())
        ->get();

    foreach ($expiredSubscriptions as $subscription) {

        // Paid package expired
        $subscription->update([
            'status' => 2,
            'updated_at' => now(),
        ]);

        // Free package activate
        $freeSubscription = Subscription::where('user_id', $subscription->user_id)
            ->where('package_id', 11)
            ->latest('id')
            ->first();

        if ($freeSubscription) {
            $freeSubscription->update([
                'status' => 1,
                'updated_at' => now(),
            ]);
        }
    }

    $this->info('Expired subscriptions processed successfully.');
}

}
