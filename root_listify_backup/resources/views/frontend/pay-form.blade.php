<!DOCTYPE html>
<html>
<head>
    <title>PhonePe Payment</title>
    <meta name="referrer" content="strict-origin-when-cross-origin">
</head>
<body>
    <h2>Pay with PhonePe</h2>

    @if(session('error'))
        <p style="color:red;">{{ session('error') }}</p>
    @endif

    <form action="{{ route('phonepe.initiate') }}" method="POST">
        @csrf

        <label>Full Name:</label>
        <input type="text" name="name" required>
        <br><br>

        <label>Phone Number:</label>
        <input type="tel" name="phone" pattern="[6-9]{1}[0-9]{9}" required>
        <br><br>

        <label>Amount (INR):</label>
        <input type="number" name="amount" min="1" required>
        <br><br>

        <label>Description:</label>
        <input type="text" name="description" required>
        <br><br>

        <button type="submit">Pay Now</button>
    </form>
</body>
</html>