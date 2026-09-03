<!doctype html>
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1"><title>Pay</title></head>
<body>
@if($errors->any()) <div style="color:red">{{ $errors->first() }}</div> @endif
<form method="POST" action="{{ route('phonepe.initiate') }}">
  @csrf
  <label>Amount (INR):</label>
  <input type="number" step="0.01" name="amount" value="10.00" required>
  <button type="submit">Pay with PhonePe</button>
</form>
</body>
</html>
