<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'resend' => [
        'key' => env('RESEND_KEY'),
    ],

    'slack' => [
        'notifications' => [
            'bot_user_oauth_token' => env('SLACK_BOT_USER_OAUTH_TOKEN'),
            'channel' => env('SLACK_BOT_USER_DEFAULT_CHANNEL'),
        ],
    ],
  
   'google' => [
       'client_id'     => env('GOOGLE_CLIENT_ID'),
       'client_secret' => env('GOOGLE_CLIENT_SECRET'),
       'redirect'      => env('GOOGLE_REDIRECT_URI'),
       'maps_api_key'  => env('GOOGLE_MAPS_API_KEY'),
   ],

   'geolocation' => [
       'enabled'      => filter_var(env('ENABLE_GEOLOCATION', true), FILTER_VALIDATE_BOOLEAN),
       'show_distance'=> filter_var(env('SHOW_DISTANCE', true), FILTER_VALIDATE_BOOLEAN),
       'radius_km'    => (int) env('NEARBY_RADIUS_KM', 50),
   ],
  'facebook' => [
      'client_id'     => env('FACEBOOK_CLIENT_ID'),
      'client_secret' => env('FACEBOOK_CLIENT_SECRET'),
      'redirect'      => env('FACEBOOK_REDIRECT'),
  ],


  'firebase' => [
      'enabled'        => filter_var(env('FIREBASE_ENABLED', false), FILTER_VALIDATE_BOOLEAN),
      'project_id'     => env('FIREBASE_PROJECT_ID'),
      'api_key'        => env('FIREBASE_API_KEY'),
      'auth_domain'    => env('FIREBASE_AUTH_DOMAIN'),
      'storage_bucket' => env('FIREBASE_STORAGE_BUCKET'),
      'messaging_sender_id' => env('FIREBASE_MESSAGING_SENDER_ID'),
      'app_id'         => env('FIREBASE_APP_ID'),
      'vapid_key'      => env('FIREBASE_VAPID_KEY'),
      'credentials'    => env('FIREBASE_CREDENTIALS')
          ? base_path(env('FIREBASE_CREDENTIALS'))
          : null,
      'push_api_key'   => env('FIREBASE_PUSH_API_KEY'),
  ],



];
