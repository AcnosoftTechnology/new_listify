/* Listify FCM Service Worker — native OS/browser notifications */
importScripts('https://www.gstatic.com/firebasejs/10.14.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.14.1/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: 'AIzaSyCgt9gMq8NfIvyM4NWCttYuaoVXA6ElGFw',
  authDomain: 'listify-asia-firbase-api.firebaseapp.com',
  projectId: 'listify-asia-firbase-api',
  storageBucket: 'listify-asia-firbase-api.firebasestorage.app',
  messagingSenderId: '948453548729',
  appId: '1:948453548729:web:febfbe72c210bdb2ab3168',
});

var messaging = firebase.messaging();

function iconUrl() {
  return self.location.origin + '/fcm-notification-icon.png';
}

function absoluteUrl(path) {
  if (!path) {
    return self.location.origin + '/agent/messages';
  }
  if (/^https?:\/\//i.test(path)) {
    try {
      var u = new URL(path);
      // Always stay on this site's origin (fixes wrong APP_URL / localhost links)
      return self.location.origin + u.pathname + u.search + u.hash;
    } catch (e) {
      return self.location.origin + '/agent/messages';
    }
  }
  if (path.charAt(0) !== '/') {
    path = '/' + path;
  }
  return self.location.origin + path;
}

function resolveClickTarget(data) {
  data = data || {};
  if (data.click_action) {
    return absoluteUrl(data.click_action);
  }
  if (data.type === 'chat' && data.sender_id && data.thread_code) {
    var prefix = data.url_prefix || 'agent';
    return absoluteUrl('/' + prefix + '/messages/' + data.sender_id + '/' + data.thread_code);
  }
  if (data.type === 'enquiry') {
    return absoluteUrl('/agent/appointment');
  }
  return absoluteUrl('/agent/messages');
}

function showSystemNotification(payload) {
  var data = (payload && payload.data) || {};
  var n = (payload && payload.notification) || {};
  var title = n.title || data.title || 'Listify';
  var body = n.body || data.body || '';
  var clickAction = resolveClickTarget(data);
  var icon = data.icon && /\.png($|\?)/i.test(data.icon) ? absoluteUrl(data.icon) : iconUrl();
  var tagKey =
    data.type === 'chat'
      ? 'chat-' + (data.thread_code || Date.now())
      : 'enquiry-' + (data.appointment_id || Date.now());

  return self.registration.showNotification(title, {
    body: body,
    icon: icon,
    badge: icon,
    data: Object.assign({}, data, { click_action: clickAction }),
    requireInteraction: true,
    renotify: true,
    silent: false,
    tag: 'listify-' + tagKey,
    vibrate: [200, 100, 200],
  });
}

messaging.onBackgroundMessage(function (payload) {
  return showSystemNotification(payload);
});

self.addEventListener('notificationclick', function (event) {
  event.notification.close();
  var data = event.notification.data || {};
  var target = resolveClickTarget(data);

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(function (clientList) {
      for (var i = 0; i < clientList.length; i++) {
        var client = clientList[i];
        if (client.url && client.url.indexOf(self.location.origin) === 0) {
          return client.focus().then(function () {
            if (typeof client.navigate === 'function') {
              return client.navigate(target).catch(function () {
                return clients.openWindow(target);
              });
            }
            return clients.openWindow(target);
          });
        }
      }
      if (clients.openWindow) {
        return clients.openWindow(target);
      }
    })
  );
});
