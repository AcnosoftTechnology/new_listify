<!doctype html>
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1"><title>Payment Result</title></head>
<body>
<h3>Thanks! Order: {{ $merchantOrderId }}</h3>
<p>Status dekhne ke liye: <a href="{{ route('phonepe.status', $merchantOrderId) }}">Check Status</a></p>
</body>
</html>
