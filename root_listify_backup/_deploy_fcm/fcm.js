(function () {
  'use strict';

  if (!window.firebaseConfig || !window.firebaseConfig.enabled) {
    return;
  }

  if (!('Notification' in window) || !('serviceWorker' in navigator)) {
    console.warn('[FCM] Notifications / Service Worker not supported in this browser');
    return;
  }

  var cfg = window.firebaseConfig;

  function getCsrfToken() {
    var meta = document.querySelector('meta[name="csrf-token"]');
    return meta ? meta.getAttribute('content') : '';
  }

  function saveToken(token) {
    return fetch(cfg.saveTokenUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
        'X-CSRF-TOKEN': getCsrfToken(),
        'X-Requested-With': 'XMLHttpRequest',
      },
      credentials: 'same-origin',
      body: JSON.stringify({ fcm_token: token }),
    })
      .then(function (res) {
        return res.json().then(function (data) {
          console.log('[FCM] Token save', res.status, data);
          return data;
        });
      })
      .catch(function (err) {
        console.error('[FCM] Token save failed', err);
      });
  }

  function waitActive(registration) {
    if (registration.active) {
      return Promise.resolve(registration);
    }
    var worker = registration.installing || registration.waiting;
    if (!worker) {
      return navigator.serviceWorker.ready.then(function () {
        return registration;
      });
    }
    return new Promise(function (resolve) {
      worker.addEventListener('statechange', function () {
        if (registration.active) {
          resolve(registration);
        }
      });
    });
  }

  /** Native OS/browser system notification (corner toast / mobile tray) */
  function showSystemNotification(title, body, data) {
    if (Notification.permission !== 'granted') {
      console.warn('[FCM] permission not granted');
      return Promise.resolve();
    }

    var click =
      (data && data.click_action) ||
      cfg.agentAppointmentsUrl ||
      '/agent/appointment';
    var icon =
      (data && data.icon && /\.png($|\?)/i.test(data.icon) && data.icon) ||
      cfg.notificationIcon ||
      '/fcm-notification-icon.png';

    var options = {
      body: body || '',
      icon: icon,
      badge: icon,
      data: Object.assign({}, data || {}, { click_action: click }),
      requireInteraction: true,
      renotify: true,
      silent: false,
      tag: 'listify-enquiry-' + ((data && data.appointment_id) || Date.now()),
      vibrate: [200, 100, 200],
    };

    return navigator.serviceWorker.ready
      .then(function (reg) {
        console.log('[FCM] SYSTEM notification via ServiceWorker.showNotification');
        return reg.showNotification(title || 'Listify', options);
      })
      .catch(function (err) {
        console.warn('[FCM] SW notification failed, Notification() fallback', err);
        try {
          var n = new Notification(title || 'Listify', options);
          n.onclick = function () {
            window.focus();
            window.location.href = click;
            n.close();
          };
        } catch (e) {
          console.error('[FCM] Native notification failed', e);
        }
      });
  }

  function init(firebaseApp, messagingMod) {
    try {
      if (!firebaseApp.getApps().length) {
        firebaseApp.initializeApp({
          apiKey: cfg.apiKey,
          authDomain: cfg.authDomain,
          projectId: cfg.projectId,
          storageBucket: cfg.storageBucket,
          messagingSenderId: cfg.messagingSenderId,
          appId: cfg.appId,
        });
      }
    } catch (e) {
      console.error('[FCM] init app failed', e);
      return;
    }

    var messaging = messagingMod.getMessaging();
    var swUrl = cfg.serviceWorkerUrl || '/firebase-messaging-sw.js';

    console.log('[FCM] Registering SW', swUrl);

    navigator.serviceWorker
      .register(swUrl)
      .then(function (reg) {
        console.log('[FCM] SW scope', reg.scope);
        return waitActive(reg);
      })
      .then(function (reg) {
        if (Notification.permission === 'default') {
          return Notification.requestPermission().then(function (p) {
            console.log('[FCM] Permission', p);
            return { reg: reg, permission: p };
          });
        }
        console.log('[FCM] Permission', Notification.permission);
        return { reg: reg, permission: Notification.permission };
      })
      .then(function (state) {
        if (!state || state.permission !== 'granted') {
          console.warn('[FCM] Notifications blocked — enable in browser site settings');
          return null;
        }
        return messagingMod.getToken(messaging, {
          vapidKey: cfg.vapidKey,
          serviceWorkerRegistration: state.reg,
        });
      })
      .then(function (token) {
        if (token) {
          console.log('[FCM] Token length', token.length);
          return saveToken(token);
        }
      })
      .catch(function (err) {
        console.error('[FCM] Setup failed', err);
      });

    // Tab OPEN / focused — still force native system notification
    messagingMod.onMessage(messaging, function (payload) {
      console.log('[FCM] Foreground push received', payload);
      var data = payload.data || {};
      var title =
        (payload.notification && payload.notification.title) ||
        data.title ||
        'Listify';
      var body =
        (payload.notification && payload.notification.body) ||
        data.body ||
        '';
      showSystemNotification(title, body, data);
    });
  }

  Promise.all([
    import('https://www.gstatic.com/firebasejs/10.14.1/firebase-app.js'),
    import('https://www.gstatic.com/firebasejs/10.14.1/firebase-messaging.js'),
  ])
    .then(function (mods) {
      init(mods[0], mods[1]);
    })
    .catch(function (err) {
      console.error('[FCM] SDK load failed', err);
    });
})();
