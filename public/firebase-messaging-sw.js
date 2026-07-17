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

/** Same folder as this SW — works on live (docroot) and local */
function iconUrl() {
  return self.location.origin + '/fcm-notification-icon.png';
}

function absoluteUrl(path) {
  if (!path) {
    return self.location.origin + '/agent/appointment';
  }
  if (/^https?:\/\//i.test(path)) {
    return path;
  }
  if (path.charAt(0) !== '/') {
    path = '/' + path;
  }
  return self.location.origin + path;
}

function showSystemNotification(payload) {
  var data = (payload && payload.data) || {};
  var n = (payload && payload.notification) || {};
  var title = n.title || data.title || 'Listify';
  var body = n.body || data.body || '';
  var clickAction = absoluteUrl(data.click_action || '/agent/appointment');
  var icon = data.icon && /\.png($|\?)/i.test(data.icon) ? absoluteUrl(data.icon) : iconUrl();

  return self.registration.showNotification(title, {
    body: body,
    icon: icon,
    badge: icon,
    data: Object.assign({}, data, { click_action: clickAction }),
    requireInteraction: true,
    renotify: true,
    silent: false,
    tag: 'listify-enquiry-' + (data.appointment_id || Date.now()),
    vibrate: [200, 100, 200],
  });
}

messaging.onBackgroundMessage(function (payload) {
  return showSystemNotification(payload);
});

self.addEventListener('notificationclick', function (event) {
  event.notification.close();
  var target = absoluteUrl(
    (event.notification.data && event.notification.data.click_action) ||
      '/agent/appointment'
  );
  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(function (clientList) {
      for (var i = 0; i < clientList.length; i++) {
        var client = clientList[i];
        if ('focus' in client) {
          try {
            if (client.navigate) {
              client.navigate(target);
            }
          } catch (e) {}
          return client.focus();
        }
      }
      if (clients.openWindow) {
        return clients.openWindow(target);
      }
    })
  );
});
