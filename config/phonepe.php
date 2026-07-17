<?php

return [
    'client_id'      => env('PHONEPE_CLIENT_ID'),
    'client_secret'  => env('PHONEPE_CLIENT_SECRET'),
    'client_version' => (int) env('PHONEPE_CLIENT_VERSION', 1),

    // SDK ke docs ke hisaab se abhi sirf PRODUCTION supported hai.
    'env'            => \PhonePe\Env::PRODUCTION,

    // Optional: redirect after payment
    'redirect_url'   => env('PHONEPE_REDIRECT_URL'),

    // Callback basic auth (docs: callback verify with basic auth)
    'callback_username' => env('PHONEPE_CALLBACK_USERNAME'),
    'callback_password' => env('PHONEPE_CALLBACK_PASSWORD'),
];