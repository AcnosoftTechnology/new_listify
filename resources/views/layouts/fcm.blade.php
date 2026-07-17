@if(
    auth()->check()
    && config('services.firebase.enabled')
    && config('services.firebase.api_key')
    && config('services.firebase.vapid_key')
)
@php
    $fcmPrefix = ((int) (auth()->user()->is_agent ?? 0) === 1 || (int) (auth()->user()->role ?? 0) === 2)
        ? 'agent'
        : 'customer';
@endphp
<script>
    window.firebaseConfig = {
        enabled: true,
        apiKey: @json(config('services.firebase.api_key')),
        authDomain: @json(config('services.firebase.auth_domain')),
        projectId: @json(config('services.firebase.project_id')),
        storageBucket: @json(config('services.firebase.storage_bucket')),
        messagingSenderId: @json(config('services.firebase.messaging_sender_id')),
        appId: @json(config('services.firebase.app_id')),
        vapidKey: @json(config('services.firebase.vapid_key')),
        saveTokenUrl: @json(route('fcm.token.store')),
        serviceWorkerUrl: @json(url('/firebase-messaging-sw.js')),
        notificationIcon: @json(url('/fcm-notification-icon.png')),
        agentAppointmentsUrl: @json(url('/agent/appointment')),
        messagesUrl: @json(url('/' . $fcmPrefix . '/messages'))
    };
</script>
<script type="module" src="{{ asset('js/fcm.js') }}?v={{ @filemtime(public_path('js/fcm.js')) ?: time() }}"></script>
@endif
