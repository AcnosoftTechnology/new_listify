<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Services\FirebaseNotificationService;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class FcmStatusCommand extends Command
{
    protected $signature = 'fcm:status {user_id? : Vendor user id to inspect}';

    protected $description = 'Show Firebase push notification readiness';

    public function handle(FirebaseNotificationService $firebase): int
    {
        $this->info('=== Firebase Push Status ===');
        $this->line('Enabled: ' . ($firebase->isEnabled() ? 'yes' : 'no'));
        $this->line('Project: ' . (config('services.firebase.project_id') ?: 'missing'));
        $this->line('VAPID: ' . (config('services.firebase.vapid_key') ? 'set' : 'MISSING'));
        $creds = config('services.firebase.credentials');
        $this->line('Credentials: ' . ($creds ?: 'missing') . ' (' . (is_readable((string) $creds) ? 'readable' : 'NOT FOUND') . ')');
        $this->line('APP_URL: ' . config('app.url'));
        $this->line('users.fcm_token column: ' . (Schema::hasColumn('users', 'fcm_token') ? 'yes' : 'no'));
        $this->line('fcm_tokens table: ' . (Schema::hasTable('fcm_tokens') ? 'yes' : 'no'));
        $iconRoot = base_path('fcm-notification-icon.png');
        $iconPublic = public_path('fcm-notification-icon.png');
        $this->line('notification icon PNG: ' . ((is_file($iconRoot) || is_file($iconPublic)) ? 'yes' : 'MISSING'));

        $userId = $this->argument('user_id');
        if ($userId) {
            $user = User::find($userId);
            if (!$user) {
                $this->error("User {$userId} not found.");

                return self::FAILURE;
            }

            $this->newLine();
            $this->info("User #{$user->id} — {$user->email}");
            $this->line('is_agent: ' . ($user->is_agent ?? 'n/a'));

            $count = 0;
            if (Schema::hasTable('fcm_tokens')) {
                $count = DB::table('fcm_tokens')->where('user_id', $user->id)->count();
            }
            $legacy = Schema::hasColumn('users', 'fcm_token') ? ($user->fcm_token ?? null) : null;
            if ($count === 0 && !empty($legacy)) {
                $count = 1;
            }

            $this->line('registered_devices: ' . $count);
            $this->line('legacy fcm_token: ' . (empty($legacy) ? 'EMPTY' : 'SET'));

            if ($count === 0) {
                $this->warn('No FCM token — this user must login, Allow notifications, and keep that browser open once so token can save.');
                $this->warn('Without a saved token, chat/enquiry push cannot reach this user.');
            } else {
                $this->info('Push can be delivered to this user.');
            }
        }

        return self::SUCCESS;
    }
}
