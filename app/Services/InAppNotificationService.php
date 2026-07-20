<?php

namespace App\Services;

use App\Models\Notifications;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;

/**
 * In-app bell notifications (header count + My Notifications page).
 * Written when FCM push events fire so web bell stays in sync with push.
 *
 * Description format:
 *   {body text}
 *   meta:type=chat;screen=chat;sender_id=10;entity_id=abc
 *   /click/path
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

            $metaLine = $this->buildMetaLine($meta);
            if ($metaLine !== '') {
                $description .= "\n" . $metaLine;
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

    protected function buildMetaLine(array $meta): string
    {
        $parts = [];
        foreach (['type', 'screen', 'sender_id', 'receiver_id', 'entity_id', 'thread_code', 'order_id', 'appointment_id'] as $key) {
            if (!isset($meta[$key]) || (string) $meta[$key] === '') {
                continue;
            }
            $parts[] = $key . '=' . str_replace([';', "\n", "\r"], '', (string) $meta[$key]);
        }

        return empty($parts) ? '' : ('meta:' . implode(';', $parts));
    }
}
