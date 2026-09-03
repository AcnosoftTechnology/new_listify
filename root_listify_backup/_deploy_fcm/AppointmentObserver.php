<?php

namespace App\Observers;

use App\Models\Appointment;
use App\Services\FirebaseNotificationService;
use Illuminate\Support\Facades\Log;

class AppointmentObserver
{
    public function __construct(
        protected FirebaseNotificationService $firebase
    ) {
    }

    /**
     * Push native system notification to listing vendor on every new enquiry.
     */
    public function created(Appointment $appointment): void
    {
        try {
            $agentId = (int) ($appointment->agent_id ?? 0);
            if ($agentId <= 0) {
                return;
            }

            $customerName = $appointment->name ?: 'A customer';
            $listingType = $appointment->listing_type ?: 'listing';

            $title = 'New enquiry received';
            $body = "{$customerName} sent an enquiry on your {$listingType}. Please take action.";

            $ok = $this->firebase->sendToUser($agentId, $title, $body, [
                'type' => 'enquiry',
                'appointment_id' => (string) $appointment->id,
                'listing_id' => (string) ($appointment->listing_id ?? ''),
                'listing_type' => (string) $listingType,
                'click_action' => url('/agent/appointment'),
            ]);

            Log::info('Enquiry push attempted', [
                'appointment_id' => $appointment->id,
                'agent_id' => $agentId,
                'sent' => $ok,
            ]);
        } catch (\Throwable $e) {
            Log::warning('Enquiry push notification failed: ' . $e->getMessage(), [
                'appointment_id' => $appointment->id ?? null,
            ]);
        }
    }
}
