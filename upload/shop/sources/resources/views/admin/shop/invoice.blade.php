<div style="font-family: Arial, sans-serif; padding: 20px; font-size: 14px; color: #333;">
    <!-- Header with Logo and Title -->
    <table width="90%" align="center" style="margin-bottom: 30px;">
        <tr>
            <td width="50%" style="text-align: left;">
                <h2 style="margin: 0;">{{ get_phrase('Order Invoice') }}</h2>
                <p><strong>{{ get_phrase('Printed on:') }}</strong> {{ \Carbon\Carbon::now()->format('D, d/M/Y') }}</p>
                <p><strong>{{ get_phrase('Order status:') }}</strong>
                    @if($invoice->delivery_status == 'delivered') 
                        <span style="color: green; font-weight: bold;">{{ get_phrase('Delivered') }}</span>
                    @else 
                        <span style="color: red; font-weight: bold;">{{ get_phrase('Pending') }}</span>
                    @endif
                </p>
            </td>
        </tr>
    </table>

    <!-- Shipping and Payment Info -->
    <table width="90%" align="center" style="margin-bottom: 30px;">
        <tr>
            <td width="50%" valign="top">
                <h4 style="margin-bottom: 10px;">{{ get_phrase('Shipping Address') }}</h4>
                <p>{{ $invoice->customer_name }}</p>
                <p>{{ $invoice->customer_phone }}</p>
                <p>{{ $invoice->customer_message }}</p>
            </td>
            <td width="50%" valign="top" style="text-align: right;">
                <h4 style="margin-bottom: 10px;">{{ get_phrase('Payment Details') }}</h4>
                <p><strong>{{ get_phrase('Payment Status:') }}</strong>
                    @if($invoice->payment_status == 'paid') 
                        <span style="color: green; font-weight: bold;">{{ get_phrase('Paid') }}</span>
                    @else 
                        <span style="color: red; font-weight: bold;">{{ get_phrase('Pending') }}</span>
                    @endif
                </p>
                <p><strong>{{ get_phrase('Order Placed At:') }}</strong> {{ \Carbon\Carbon::parse($invoice->created_at)->format('D, d/M/Y') }}</p>
                <p><strong>{{ get_phrase('Order Delivered At:') }}</strong>
                    @if($invoice->delivery_status == 'delivered') 
                        {{ \Carbon\Carbon::parse($invoice->updated_at)->format('D, d/M/Y') }}
                    @else 
                        {{ get_phrase('No delivered yet.') }}
                    @endif
                </p>
            </td>
        </tr>
    </table>

    <!-- Product Table -->
    <div style="width: 90%; margin: auto;">
        <h4 style="margin-bottom: 10px;">{{ get_phrase('Order Summary') }}</h4>
        <table width="100%" cellpadding="8" cellspacing="0" style="border-collapse: collapse; border: 1px solid #ccc;">
            <thead style="background-color: #f5f5f5;">
                <tr>
                    <th style="border: 1px solid #ccc;">#</th>
                    <th style="border: 1px solid #ccc;">{{ get_phrase('Products') }}</th>
                    <th style="border: 1px solid #ccc;">{{ get_phrase('Unit Price') }}</th>
                    <th style="border: 1px solid #ccc;">{{ get_phrase('Quantity') }}</th>
                    <th style="border: 1px solid #ccc;">{{ get_phrase('Total') }}</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $products = json_decode($invoice->product, true); 
                    $num = 1;
                @endphp

                @foreach ($products as $product)
                    @php
                        $inventory = \App\Models\Inventory::find($product['product_id']);
                        $unit_price = $product['price'] ?? 0;
                        $quantity = $product['quantity'] ?? 0;
                        $total_price = $unit_price * $quantity;
                    @endphp
                    @if($inventory)
                        <tr>
                            <td style="border: 1px solid #ccc; text-align: center;">{{ $num++ }}</td>
                            <td style="border: 1px solid #ccc;">{{ $inventory->name }}</td>
                            <td style="border: 1px solid #ccc; text-align: right;">${{ number_format($unit_price, 2) }}</td>
                            <td style="border: 1px solid #ccc; text-align: center;">{{ $quantity }}</td>
                            <td style="border: 1px solid #ccc; text-align: right;">${{ number_format($total_price, 2) }}</td>
                        </tr>
                    @endif
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" style="border: 1px solid #ccc; text-align: right; font-weight: bold;">{{ get_phrase('Sub Total Amount:') }}</td>
                    <td style="border: 1px solid #ccc; text-align: right;">{{ currency($invoice->amount) }}</td>
                </tr>
                <tr>
                    <td colspan="4" style="border: 1px solid #ccc; text-align: right; font-weight: bold;">{{ get_phrase('Grand Total:') }}</td>
                    <td style="border: 1px solid #ccc; text-align: right;">{{ currency($invoice->amount) }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
