<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notifications extends Model
{
    use HasFactory;

    protected $table = 'notifications';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'media',
        'title',
        'description',
        'read_on',
        'status',
        'created_at',
    ];

    /**
     * Human-readable body only.
     * InAppNotificationService appends meta + click_action into description for deep links;
     * those must not be shown in the UI.
     */
    public function displayDescription(): string
    {
        $lines = preg_split("/\r\n|\n|\r/", (string) $this->description);
        if (!is_array($lines)) {
            return trim((string) $this->description);
        }

        $bodyLines = [];
        foreach ($lines as $line) {
            $trimmed = trim($line);
            if ($trimmed === '') {
                if ($bodyLines !== []) {
                    $bodyLines[] = $line;
                }
                continue;
            }
            if (str_starts_with($trimmed, 'meta:')) {
                break;
            }
            if ($this->isStoredClickActionLine($trimmed)) {
                break;
            }
            $bodyLines[] = $line;
        }

        return trim(implode("\n", $bodyLines));
    }

    /**
     * Deep-link / click path stored after the body (relative or absolute).
     */
    public function clickActionUrl(?string $fallback = null): string
    {
        $lines = preg_split("/\r\n|\n|\r/", (string) $this->description);
        if (is_array($lines)) {
            for ($i = count($lines) - 1; $i >= 0; $i--) {
                $trimmed = trim($lines[$i]);
                if ($trimmed === '' || str_starts_with($trimmed, 'meta:')) {
                    continue;
                }
                if ($this->isStoredClickActionLine($trimmed)) {
                    return str_starts_with($trimmed, 'http')
                        ? $trimmed
                        : url($trimmed);
                }
                break;
            }

            foreach ($lines as $line) {
                $trimmed = trim($line);
                if (!str_starts_with($trimmed, 'meta:')) {
                    continue;
                }
                if (preg_match('/(?:^|;|\s)url=([^;]+)/i', $trimmed, $m)) {
                    $url = trim($m[1]);
                    if ($url !== '') {
                        return str_starts_with($url, 'http') ? $url : url($url);
                    }
                }
            }
        }

        return $fallback ?? route('customer.notification');
    }

    protected function isStoredClickActionLine(string $line): bool
    {
        if (preg_match('#^https?://#i', $line)) {
            return true;
        }

        return str_starts_with($line, '/')
            && !str_contains($line, ' ')
            && preg_match('#^/(agent|customer|admin|user)/#', $line);
    }
}
