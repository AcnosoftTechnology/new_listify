<!DOCTYPE html>
<html>
<head>
    <title>PhonePe Payment Test</title>
</head>
<body>
    <h1>Test Payment Gateway</h1>

    @if(session('error'))
        <div style="color:red;">{{ session('error') }}</div>
    @endif

    <form method="POST" action="{{ route('payment.initiate') }}">
        @csrf
        <label>Amount (INR):</label>
        <input type="number" name="amount" value="{{ old('amount') }}" required min="1" step="0.01" />
        <button type="submit">Pay Now</button>
    </form>
</body>
</html>
