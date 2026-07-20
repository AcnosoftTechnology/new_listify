<?php

namespace App\Observers;

use App\Models\Inventory;
use App\Models\InventoryPurchase;
use App\Services\FirebaseNotificationService;
use Illuminate\Support\Facades\Log;

class InventoryPurchaseObserver
{
    public function __construct(
        protected FirebaseNotificationService $firebase
    ) {
    }

    /**
     * Push native system notification to vendor when a customer places a shop order.
     */
    public function created(InventoryPurchase $order): void
    {
        try {
            $vendorId = (int) ($order->listing_creator_id ?? 0);
            if ($vendorId <= 0) {
                return;
            }

            $customerName = trim((string) ($order->customer_name ?? '')) ?: 'A customer';
            $productLabel = $this->productLabel($order);
            $amount = $order->amount ?? 0;
            $amountLabel = is_numeric($amount)
                ? ('₹' . number_format((float) $amount, 2))
                : (string) $amount;

            $title = 'New shop order received';
            $body = "{$customerName} ordered {$productLabel} ({$amountLabel}). Tap to open this order.";

            // Relative path — SW resolves with live origin; order_id opens Order Manager on that row
            $click = '/agent/order-manager?order_id=' . (int) $order->id;

            $ok = $this->firebase->sendToUser($vendorId, $title, $body, [
                'type' => 'order',
                'sender_id' => (string) ($order->user_id ?? ''),
                'order_id' => (string) $order->id,
                'listing_id' => (string) ($order->listing_id ?? ''),
                'listing_type' => (string) ($order->type ?? ''),
                'click_action' => $click,
            ]);

            Log::info('Shop order push attempted', [
                'order_id' => $order->id,
                'vendor_id' => $vendorId,
                'sent' => $ok,
            ]);
        } catch (\Throwable $e) {
            Log::warning('Shop order push notification failed: ' . $e->getMessage(), [
                'order_id' => $order->id ?? null,
            ]);
        }
    }

    protected function productLabel(InventoryPurchase $order): string
    {
        $products = json_decode((string) ($order->product ?? ''), true);
        if (!is_array($products) || empty($products)) {
            return 'product(s)';
        }

        $names = [];
        foreach ($products as $row) {
            $productId = is_array($row)
                ? (int) ($row['product_id'] ?? $row['id'] ?? 0)
                : (int) $row;
            if ($productId <= 0) {
                continue;
            }
            $name = Inventory::where('id', $productId)->value('name');
            if ($name) {
                $qty = is_array($row) ? (int) ($row['quantity'] ?? 1) : 1;
                $names[] = $qty > 1 ? "{$name} x{$qty}" : $name;
            }
        }

        if (empty($names)) {
            return 'product(s)';
        }

        $label = implode(', ', array_slice($names, 0, 2));
        if (count($names) > 2) {
            $label .= ' +' . (count($names) - 2) . ' more';
        }

        return $label;
    }
}
