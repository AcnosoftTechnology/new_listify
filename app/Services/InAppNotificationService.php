<?php

namespace App\Services;

use App\Models\Notifications;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;

/**
 * In-app bell notifications (header count + My Notifications page).
 * Written when FCM push events fire so web bell stays in sync with push.
 */
class InAppNotificationService
{
    public function record(int $userId, string $title, string $body, array $meta = []): void
    {
        try {
            if ($userId <= 0 || !Schema::hasTable('notifications')) {
                return;
            }

            $title = trim(mb_substr($title, 0, 250));
            $description = trim($body);

            if ($description === '') {
                $description = $title;
            }

            if (!empty($meta['click_action'])) {
                $description .= "\n" . trim((string) $meta['click_action']);
            }

            Notifications::create([
                'user_id' => (string) $userId,
                'media' => null,
                'title' => $title !== '' ? $title : 'Notification',
                'description' => $description,
                'read_on' => '0',
                'status' => '1',
                'created_at' => now(),
            ]);
        } catch (\Throwable $e) {
            Log::warning('In-app notification record failed: ' . $e->getMessage(), [
                'user_id' => $userId,
            ]);
        }
    }
}
