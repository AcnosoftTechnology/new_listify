<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>{{ get_phrase('Subscription Invoice') }} | {{ get_phrase('Agent Panel') }}</title>

    <link rel="stylesheet" href="{{ asset('assets/global/css/bootstrap.min.css') }}">

<style>

    /* ============================================================
       GLOBAL
    ============================================================ */

    * {
        box-sizing: border-box;
    }

    @page {
        size: A4 portrait;
        margin: 10mm;
    }

    html,
    body {
        width: 100%;
        margin: 0;
        padding: 0;
    }

    body {
        background: #ffffff;
        color: #1f2937;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
    }

    p {
        margin: 0;
    }


    /* ============================================================
       PAGE
    ============================================================ */

    .invoice-page {
        width: 100%;
        max-width: 190mm;
        min-height: 277mm;
        margin: 0 auto;
        padding: 0;
        position: relative;
        background: #ffffff;
        overflow: hidden;
    }

    .page-break {
        page-break-after: always;
        break-after: page;
    }


    /* ============================================================
       PAGE 1 HEADER
    ============================================================ */

    .header-table {
        width: 100%;
        max-width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        margin-top: 18mm;
        margin-bottom: 18mm;
    }

    .header-table td {
        padding: 0;
        vertical-align: top;
        overflow: hidden;
        word-wrap: break-word;
        overflow-wrap: break-word;
    }

    .header-logo-cell {
        width: 50%;
        text-align: left;
    }

    .header-invoice-cell {
        width: 50%;
        text-align: right;
    }

    .company-logo {
        width: 28mm;
        height: 28mm;
        max-width: 100%;
        display: inline-block;
        overflow: hidden;
    }

    .company-logo img {
        width: 100%;
        height: 100%;
        max-width: 100%;
        display: block;
        object-fit: contain;
    }

    .invoice-title {
        margin: 0;
        font-size: 26px;
        line-height: 1;
        font-weight: 700;
        letter-spacing: 1px;
        color: #111827;
        word-break: break-word;
    }

    .invoice-no {
        margin-top: 3px;
        font-size: 13px;
        font-weight: 700;
        color: #4b5563;
        overflow-wrap: break-word;
    }

    .invoice-status {
        margin-top: 4px;
        font-size: 12px;
        font-weight: 500;
        color: #dc2626;
        text-transform: uppercase;
    }

    .invoice-status.paid {
        color: #166534;
    }


    /* ============================================================
       COMPANY + BILLING INFORMATION
    ============================================================ */

    .info-table {
        width: 100%;
        max-width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        margin-bottom: 18mm;
    }

    .info-table td {
        padding: 0;
        vertical-align: top;
        overflow: hidden;
        word-wrap: break-word;
        overflow-wrap: break-word;
    }

    .company-info-cell {
        width: 48%;
        text-align: left;
    }

    .customer-info-cell {
        width: 52%;
        text-align: right;
    }

    .company-info,
    .billing-block {
        max-width: 100%;
        overflow-wrap: break-word;
        word-wrap: break-word;
    }

    .company-name {
        margin-bottom: 3px;
        font-size: 12px;
        font-weight: 700;
    }

    .company-info p {
        margin-bottom: 2px;
        line-height: 1.25;
        color: #374151;
        overflow-wrap: break-word;
        word-break: break-word;
    }

    .billing-block {
        margin-bottom: 12px;
    }

    .billing-title {
        margin-bottom: 3px;
        font-size: 12px;
        font-weight: 700;
        color: #111827;
    }

    .billing-block p {
        margin-bottom: 2px;
        line-height: 1.25;
        color: #374151;
        overflow-wrap: break-word;
        word-break: break-word;
    }

    .billing-name {
        font-weight: 700;
    }

    .invoice-date-section {
        margin-top: 12px;
    }

    .invoice-date-section p {
        margin-bottom: 3px;
        font-size: 11px;
        font-weight: 500;
        color: #111827;
        overflow-wrap: break-word;
    }


    /* ============================================================
       PRODUCT TABLE
    ============================================================ */

    .invoice-items-table {
        width: 100%;
        max-width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        margin-top: 5px;
    }

    .invoice-items-table th,
    .invoice-items-table td {
        overflow: hidden;
        word-wrap: break-word;
        overflow-wrap: break-word;
    }

    .invoice-items-table thead th {
        padding: 7px 5px;
        background: #e1e4e9;
        color: #374151;
        font-size: 10px;
        font-weight: 600;
        text-align: left;
    }

    .invoice-items-table tbody td {
        padding: 8px 5px;
        vertical-align: top;
        font-size: 10px;
        line-height: 1.3;
    }

    .text-center {
        text-align: center !important;
    }

    .text-right {
        text-align: right !important;
    }

    .item-name {
        margin-bottom: 3px;
        font-weight: 700;
        color: #111827;
        overflow-wrap: break-word;
    }

    .item-description {
        color: #374151;
        line-height: 1.35;
        overflow-wrap: break-word;
        word-break: break-word;
    }


    /* ============================================================
       TOTAL SECTION
    ============================================================ */

    .summary-space {
        height: 35mm;
    }

    .summary-table {
        width: 47%;
        max-width: 47%;
        margin-left: auto;
        border-collapse: collapse;
        table-layout: fixed;
    }

    .summary-table td {
        padding: 5px 7px;
        font-size: 10px;
        text-align: right;
        overflow: hidden;
        word-wrap: break-word;
        overflow-wrap: break-word;
    }

    .summary-label {
        width: 65%;
        font-weight: 700;
    }

    .summary-amount {
        width: 35%;
    }

    .summary-total-row {
        background: #e1e4e9;
    }

    .summary-total-row td {
        font-weight: 700;
    }

    .summary-due-row {
        background: #d4d8de;
    }

    .summary-due-row td {
        padding-top: 7px;
        padding-bottom: 7px;
        font-weight: 700;
    }


    /* ============================================================
       PAYMENT SECTION
    ============================================================ */

    .payment-section {
        margin-top: 12mm;
    }

    .payment-section h4 {
        margin: 0 0 7px;
        font-size: 11px;
        font-weight: 700;
        color: #111827;
    }

    .payment-section p {
        margin-bottom: 6px;
        font-size: 10px;
        color: #1f2937;
        overflow-wrap: break-word;
    }

    .note-section {
        margin-top: 10mm;
    }

    .note-section h4 {
        margin: 0 0 7px;
        font-size: 11px;
        font-weight: 700;
        color: #111827;
    }

    .note-section p {
        font-size: 10px;
        overflow-wrap: break-word;
    }


    /* ============================================================
       PAGE NUMBER
    ============================================================ */

    .page-number {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 3mm;
        text-align: center;
        font-size: 8px;
        color: #6b7280;
    }


    /* ============================================================
       PAGE 2
    ============================================================ */

    .page-two-content {
        padding: 5mm 4mm 0;
        max-width: 100%;
        overflow: hidden;
    }

    .bank-details {
        margin-bottom: 12mm;
        max-width: 100%;
    }

    .bank-details p {
        margin-bottom: 4px;
        font-size: 12px;
        line-height: 1.25;
        color: #1f2937;
        overflow-wrap: break-word;
        word-break: break-word;
    }


    /* ============================================================
       TERMS & CONDITIONS
    ============================================================ */

    .terms-section {
        max-width: 100%;
        margin-top: 18mm;
    }

    .terms-section h3 {
        margin: 0 0 8px;
        font-size: 12px;
        font-weight: 700;
        line-height: 1.25;
        color: #111827;
    }

    .terms-section p {
        margin-bottom: 10px;
        font-size: 12px;
        line-height: 1.35;
        color: #111827;
        overflow-wrap: break-word;
        word-break: break-word;
    }


    /* ============================================================
       SIGNATURE
    ============================================================ */

    .signature-section {
        margin-top: 20mm;
        text-align: left;
        max-width: 100%;
    }

    .signature-title {
        margin-bottom: 5px;
        font-size: 12px;
        line-height: 1.25;
        color: #111827;
    }

    .signature-image {
        width: 40mm;
        max-width: 100%;
        height: 30mm;
        object-fit: contain;
        display: block;
    }


    /* ============================================================
       PRINT
    ============================================================ */

    @media print {

        html,
        body {
            width: 100%;
            margin: 0;
            padding: 0;
            background: #ffffff;
        }

        .invoice-page {
            width: 100%;
            max-width: 190mm;
            min-height: 277mm;
            margin: 0 auto;
            padding: 0;
            overflow: hidden;
        }

        .page-break {
            page-break-after: always;
            break-after: page;
        }

        .invoice-page:last-child {
            page-break-after: auto;
            break-after: auto;
        }

        .header-table,
        .info-table,
        .invoice-items-table {
            width: 100%;
            max-width: 100%;
            table-layout: fixed;
        }
    }

</style>
</head>

<body>


@php

    /*
    |--------------------------------------------------------------------------
    | DYNAMIC DATES
    |--------------------------------------------------------------------------
    */

    $created_at = !empty($subscriptionDetails->created_at)
        ? date('d/m/Y', strtotime($subscriptionDetails->created_at))
        : 'N/A';

    $expire_date = !empty($subscriptionDetails->expire_date)
        ? date('d/m/Y', strtotime($subscriptionDetails->expire_date))
        : 'N/A';


    /*
    |--------------------------------------------------------------------------
    | PACKAGE
    |--------------------------------------------------------------------------
    */

    $package = App\Models\Pricing::find($subscriptionDetails->package_id);


    /*
    |--------------------------------------------------------------------------
    | BILLING DETAILS FROM SUBSCRIPTIONS TABLE
    |--------------------------------------------------------------------------
    */

    $billingName = $subscriptionDetails->billing_name ?? 'N/A';

    $billingEmail = $subscriptionDetails->billing_email ?? 'N/A';

    $billingPhone = $subscriptionDetails->billing_phone ?? 'N/A';

    $billingAddress = $subscriptionDetails->billing_address ?? 'N/A';

    $billingCity = $subscriptionDetails->billing_city ?? 'N/A';

    $billingState = $subscriptionDetails->billing_state ?? 'N/A';

    $billingCountry = $subscriptionDetails->billing_country ?? 'India';

    $billingPincode = $subscriptionDetails->billing_pincode ?? 'N/A';

    $hasGst = !empty($subscriptionDetails->has_gst)
        && (int)$subscriptionDetails->has_gst === 1;

    $gstNumber = $subscriptionDetails->gst_number ?? null;


    /*
    |--------------------------------------------------------------------------
    | PAYMENT STATUS
    |--------------------------------------------------------------------------
    */

    $isPaid = !empty($subscriptionDetails->paid_amount)
        && $subscriptionDetails->paid_amount > 0;

    $status = $isPaid
        ? get_phrase('PAID')
        : get_phrase('UNPAID');


    /*
    |--------------------------------------------------------------------------
    | AMOUNTS
    |--------------------------------------------------------------------------
    */

    // Original package price without GST
    $packagePrice = (float) ($package->price ?? 0);

    // Actual amount paid by customer
    // Isme GST included amount save hona chahiye
    $paidAmount = (float) ($subscriptionDetails->paid_amount ?? 0);


    /*
    |--------------------------------------------------------------------------
    | GST CALCULATION
    |--------------------------------------------------------------------------
    |
    | Haryana = CGST 9% + SGST 9%
    | Other States = IGST 18%
    |
    | Actual tax amount = Paid Amount - Package Price
    |
    | Isse invoice wahi amount show karega jo customer se
    | actual payment gateway par charge hua tha.
    |--------------------------------------------------------------------------
    */

    $billingStateNormalized = strtolower(trim($billingState));

    $isHaryana = in_array($billingStateNormalized, [
        'haryana',
        'hr'
    ]);


    // Actual tax amount
    $actualTaxAmount = max(
        0,
        round($paidAmount - $packagePrice, 2)
    );


    // Default values
    $igstAmount = 0;
    $cgstAmount = 0;
    $sgstAmount = 0;

    $igstRate = 0;
    $cgstRate = 0;
    $sgstRate = 0;


    /*
    |--------------------------------------------------------------------------
    | HARYANA = CGST + SGST
    |--------------------------------------------------------------------------
    */

    if ($actualTaxAmount > 0 && $isHaryana) {

        $cgstRate = 9;
        $sgstRate = 9;

        $cgstAmount = round($actualTaxAmount / 2, 2);

        $sgstAmount = round(
            $actualTaxAmount - $cgstAmount,
            2
        );
    }


    /*
    |--------------------------------------------------------------------------
    | OTHER STATE = IGST
    |--------------------------------------------------------------------------
    */

    elseif ($actualTaxAmount > 0 && !$isHaryana) {

        $igstRate = 18;

        $igstAmount = $actualTaxAmount;
    }


    /*
    |--------------------------------------------------------------------------
    | GRAND TOTAL
    |--------------------------------------------------------------------------
    */

    $subtotalAmount = $packagePrice;

    $totalTaxAmount = round(
        $igstAmount + $cgstAmount + $sgstAmount,
        2
    );

    // Actual paid amount ko priority
    $grandTotal = $paidAmount;


    /*
    |--------------------------------------------------------------------------
    | TAX LABEL FOR ITEM TABLE
    |--------------------------------------------------------------------------
    */

    if ($totalTaxAmount <= 0) {

        $taxLabel = '-';

    } elseif ($isHaryana) {

        $taxLabel = 'CGST 9% + SGST 9%';

    } else {

        $taxLabel = 'IGST 18%';
    }

@endphp



<!-- ================================================================
     INVOICE - SINGLE PAGE
================================================================ -->

<div class="invoice-page">


    <!-- ============================================================
         HEADER
    ============================================================ -->

    <table class="header-table">

        <tr>

            <!-- LOGO LEFT -->

            <td class="header-logo-cell">
                <div class="company-logo">
                    <img
                        src="https://www.listify.asia/public/image/logo.png"
                        alt="Company Logo"
                    >
                </div>
            </td>


            <!-- INVOICE DETAILS RIGHT -->

            <td class="header-invoice-cell">

                <h1 class="invoice-title">
                    {{ get_phrase('INVOICE') }}
                </h1>

                <div class="invoice-no">
                    # INV-CM-{{ $subscriptionDetails->id }}
                </div>

                <div class="invoice-status {{ $isPaid ? 'paid' : '' }}">
                    {{ $status }}
                </div>

            </td>

        </tr>

    </table>



    <!-- ============================================================
         COMPANY + CUSTOMER DETAILS
    ============================================================ -->

    <table class="info-table">

        <tr>

            <!-- COMPANY DETAILS -->

            <td class="company-info-cell">

                <div class="company-info">

                    <div class="company-name">
                        Corp Marvel Infotech
                    </div>

                    <p>TDI Kingsbury, SCO No.44, 2nd Floor, Club Rd, near TDI Club</p>

                    <p>Kundli, Sonipat,</p>

                    <p>Haryana-131023, India</p>

                    <p>Mobile: 7404917988</p>

                    <p>www.corpmarvel.com</p>

                    <p>
                        GST number: 06AGTPR5117N1ZO
                    </p>

                </div>

            </td>



            <!-- DYNAMIC CUSTOMER DETAILS -->

            <td class="customer-info-cell">


                <!-- BILL TO -->

                <div class="billing-block">

                    <div class="billing-title">
                        {{ get_phrase('Bill To:') }}
                    </div>

                    <p class="billing-name">
                        {{ $billingName }}
                    </p>

                    <p>
                        {{ $billingAddress }}
                    </p>

                    <p>
                        {{ $billingCity }},
                        {{ $billingState }}
                        - {{ $billingPincode }}
                    </p>

                    <p>
                        {{ $billingCountry }}
                    </p>

                    <p>
                        Email: {{ $billingEmail }}
                    </p>

                    <p>
                        Phone: {{ $billingPhone }}
                    </p>

                    @if($hasGst && !empty($gstNumber))

                        <p>
                            GSTIN: {{ $gstNumber }}
                        </p>

                    @endif

                </div>


                <!-- INVOICE DATES -->

                <div class="invoice-date-section">

                    <p>
                        Invoice Date: {{ $created_at }}
                    </p>

                </div>


            </td>

        </tr>

    </table>



    <!-- ============================================================
         ITEMS TABLE
    ============================================================ -->

    <table class="invoice-items-table">

        <thead>

            <tr>

                <th style="width: 5%;" class="text-center">
                    #
                </th>

                <th style="width: 47%;">
                    Item
                </th>

                <th style="width: 8%;" class="text-center">
                    Qty
                </th>

                <th style="width: 13%;" class="text-right">
                    Rate
                </th>

                <th style="width: 12%;" class="text-center">
                    Tax
                </th>

                <th style="width: 15%;" class="text-right">
                    Amount
                </th>

            </tr>

        </thead>


        <tbody>

            <tr>


                <!-- SERIAL -->

                <td class="text-center">
                    1
                </td>



                <!-- PACKAGE -->

                <td>

                    <div class="item-name">
                        {{ $package->name ?? 'N/A' }}
                    </div>

                </td>



                <!-- QTY -->

                <td class="text-center">
                    1
                </td>



                <!-- RATE / BASE AMOUNT -->

                <td class="text-right">
                    Rs.{{ number_format($packagePrice, 2) }}
                </td>



                <!-- DYNAMIC TAX -->

                <td class="text-center">

                    @if($totalTaxAmount > 0)

                        {{ $taxLabel }}

                    @else

                        -

                    @endif

                </td>



                <!-- ACTUAL GRAND AMOUNT -->

                <td class="text-right">
                    Rs.{{ number_format($grandTotal, 2) }}
                </td>


            </tr>

        </tbody>

    </table>



    <!-- ============================================================
         TOTALS
    ============================================================ -->

    <table class="summary-table">


        <!-- SUB TOTAL -->

        <tr>

            <td class="summary-label">
                Sub Total
            </td>

            <td class="summary-amount">
                Rs.{{ number_format($subtotalAmount, 2) }}
            </td>

        </tr>



        <!-- HARYANA GST - CGST -->

        @if($cgstAmount > 0)

            <tr>

                <td class="summary-label">
                    CGST ({{ number_format($cgstRate, 2) }}%)
                </td>

                <td class="summary-amount">
                    Rs.{{ number_format($cgstAmount, 2) }}
                </td>

            </tr>

        @endif


        <!-- HARYANA GST - SGST -->

        @if($sgstAmount > 0)

            <tr>

                <td class="summary-label">
                    SGST ({{ number_format($sgstRate, 2) }}%)
                </td>

                <td class="summary-amount">
                    Rs.{{ number_format($sgstAmount, 2) }}
                </td>

            </tr>

        @endif



        <!-- OTHER STATES GST - IGST -->

        @if($igstAmount > 0)

            <tr>

                <td class="summary-label">
                    IGST ({{ number_format($igstRate, 2) }}%)
                </td>

                <td class="summary-amount">
                    Rs.{{ number_format($igstAmount, 2) }}
                </td>

            </tr>

        @endif



        <!-- TOTAL TAX -->

        @if($totalTaxAmount > 0)

            <tr>

                <td class="summary-label">
                    Total Tax
                </td>

                <td class="summary-amount">
                    Rs.{{ number_format($totalTaxAmount, 2) }}
                </td>

            </tr>

        @endif



        <!-- TOTAL -->

        <tr class="summary-total-row">

            <td class="summary-label">
                Total Paid
            </td>

            <td class="summary-amount">
                Rs.{{ number_format($grandTotal, 2) }}
            </td>

        </tr>


    </table>



    <!-- ============================================================
         TERMS & CONDITIONS
    ============================================================ -->

    <div class="terms-section">

        <h3>
            Terms & Conditions:
        </h3>

        <p>
            Payment terms shall be determined by mutual consent or as
            expressly agreed upon, ensuring clarity and alignment between
            all concerned parties during the transaction process.
        </p>

        <p>
            All legal matters and disputes shall fall exclusively under
            the jurisdiction of Haryana, ensuring resolution within the
            legal framework of this designated territorial authority.
        </p>

    </div>



    <!-- ============================================================
         AUTHORIZED SIGNATURE
    ============================================================ -->

    <div class="signature-section">

        <div class="signature-title">
            Authorized Signature
        </div>

        <img
            src="{{ asset('assets/images/signature.png') }}"
            alt="Authorized Signaturegit "
            class="signature-image"
        >

    </div>


</div>


<script src="{{ asset('assets/global/js/bootstrap.bundle.min.js') }}"></script>

</body>
</html>