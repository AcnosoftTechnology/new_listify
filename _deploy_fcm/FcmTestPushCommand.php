<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Services\FirebaseNotificationService;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class FcmTestPushCommand extends Command
{
    protected $signature = 'fcm:test {user_id : Vendor user id to send test push}';

    protected $description = 'Send a test Firebase push notification to a vendor';

    public function handle(FirebaseNotificationService $firebase): int
    {
        $user = User::find($this->argument('user_id'));
        if (!$user) {
            $this->error('User not found.');

            return self::FAILURE;
        }

        $hasToken = false;
        if (Schema::hasTable('fcm_tokens')) {
            $hasToken = DB::table('fcm_tokens')->where('user_id', $user->id)->exists();
        }
        if (!$hasToken && Schema::hasColumn('users', 'fcm_token') && !empty($user->fcm_token)) {
            $hasToken = true;
        }

        if (!$hasToken) {
            $this->error("User {$user->email} has no FCM token. Login as vendor and Allow browser notifications first.");

            return self::FAILURE;
        }

        if (!$firebase->isEnabled()) {
            $this->error('Firebase is not enabled or credentials are missing.');
            $this->line('Add storage/app/firebase-credentials.json from Firebase Console → Service accounts.');

            return self::FAILURE;
        }

        $ok = $firebase->sendToUser(
            (int) $user->id,
            'Listify test notification',
            'Push system is working. You will get alerts when customers submit enquiries.',
            [
                'type' => 'test',
                'click_action' => url('/agent/appointment'),
            ]
        );

        if ($ok) {
            $this->info("Test push sent to {$user->email}");

            return self::SUCCESS;
        }

        $this->error('Push failed. Check storage/logs/laravel.log for FCM API errors.');

        return self::FAILURE;
    }
}
