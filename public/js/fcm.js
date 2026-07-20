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
  var messagingRef = null;
  var messagingModRef = null;
  var setupStarted = false;

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
          if (data && data.skipped) {
            console.warn('[FCM] Token NOT saved for this account:', data.skipped);
          }
          if (data && data.success && !data.skipped) {
            console.log('[FCM] Token registered for user_id=', data.user_id);
          }
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

  function removePrompt() {
    var el = document.getElementById('listify-fcm-prompt');
    if (el && el.parentNode) {
      el.parentNode.removeChild(el);
    }
  }

  /** Visible prompt — browsers often block auto permission without a user click */
  function showPermissionPrompt() {
    if (document.getElementById('listify-fcm-prompt')) {
      return;
    }
    if (sessionStorage.getItem('listify_fcm_prompt_dismissed') === '1') {
      return;
    }

    var wrap = document.createElement('div');
    wrap.id = 'listify-fcm-prompt';
    wrap.setAttribute('role', 'dialog');
    wrap.setAttribute('aria-live', 'polite');
    wrap.innerHTML =
      '<div class="listify-fcm-prompt__card">' +
      '<div class="listify-fcm-prompt__text">' +
      '<strong>Enable notifications</strong>' +
      '<span>Allow browser alerts for new messages and enquiries — even when this tab is closed or minimized.</span>' +
      '</div>' +
      '<div class="listify-fcm-prompt__actions">' +
      '<button type="button" class="listify-fcm-prompt__allow" id="listify-fcm-allow">Allow notifications</button>' +
      '<button type="button" class="listify-fcm-prompt__later" id="listify-fcm-later">Not now</button>' +
      '</div>' +
      '</div>';

    var style = document.createElement('style');
    style.textContent =
      '#listify-fcm-prompt{position:fixed;left:16px;right:16px;bottom:16px;z-index:99999;display:flex;justify-content:center;pointer-events:none}' +
      '#listify-fcm-prompt .listify-fcm-prompt__card{pointer-events:auto;max-width:560px;width:100%;background:#0f172a;color:#f8fafc;border-radius:14px;padding:16px 18px;box-shadow:0 18px 50px rgba(15,23,42,.35);display:flex;gap:14px;align-items:center;flex-wrap:wrap;font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif}' +
      '#listify-fcm-prompt .listify-fcm-prompt__text{flex:1 1 240px;display:flex;flex-direction:column;gap:4px}' +
      '#listify-fcm-prompt .listify-fcm-prompt__text strong{font-size:15px;font-weight:700}' +
      '#listify-fcm-prompt .listify-fcm-prompt__text span{font-size:13px;line-height:1.4;opacity:.9}' +
      '#listify-fcm-prompt .listify-fcm-prompt__actions{display:flex;gap:8px;flex-wrap:wrap}' +
      '#listify-fcm-prompt .listify-fcm-prompt__allow{border:0;background:#16a34a;color:#fff;font-weight:600;font-size:13px;padding:10px 14px;border-radius:10px;cursor:pointer}' +
      '#listify-fcm-prompt .listify-fcm-prompt__later{border:1px solid rgba(248,250,252,.25);background:transparent;color:#f8fafc;font-size:13px;padding:10px 14px;border-radius:10px;cursor:pointer}';
    document.head.appendChild(style);
    document.body.appendChild(wrap);

    document.getElementById('listify-fcm-allow').addEventListener('click', function () {
      removePrompt();
      askPermissionAndRegister(true);
    });
    document.getElementById('listify-fcm-later').addEventListener('click', function () {
      sessionStorage.setItem('listify_fcm_prompt_dismissed', '1');
      removePrompt();
    });
  }

  function showBlockedHint() {
    if (document.getElementById('listify-fcm-prompt')) {
      return;
    }
    var wrap = document.createElement('div');
    wrap.id = 'listify-fcm-prompt';
    wrap.innerHTML =
      '<div class="listify-fcm-prompt__card">' +
      '<div class="listify-fcm-prompt__text">' +
      '<strong>Notifications are blocked</strong>' +
      '<span>Click the lock/info icon in the address bar → Site settings → Notifications → Allow, then refresh.</span>' +
      '</div>' +
      '<div class="listify-fcm-prompt__actions">' +
      '<button type="button" class="listify-fcm-prompt__later" id="listify-fcm-later">Dismiss</button>' +
      '</div>' +
      '</div>';
    document.body.appendChild(wrap);
    document.getElementById('listify-fcm-later').addEventListener('click', removePrompt);
  }

  function toAbsolute(path) {
    if (!path) {
      return window.location.origin + (cfg.messagesUrl || '/agent/messages');
    }
    if (/^https?:\/\//i.test(path)) {
      try {
        var u = new URL(path);
        return window.location.origin + u.pathname + u.search + u.hash;
      } catch (e) {
        return window.location.origin + (cfg.messagesUrl || '/agent/messages');
      }
    }
    if (path.charAt(0) !== '/') {
      path = '/' + path;
    }
    return window.location.origin + path;
  }

  /** Native OS/browser system notification (corner toast / mobile tray) */
  function showSystemNotification(title, body, data) {
    if (Notification.permission !== 'granted') {
      console.warn('[FCM] permission not granted');
      return Promise.resolve();
    }

    var click = toAbsolute(
      (data && data.click_action) ||
        (data && data.type === 'chat'
          ? '/' +
            ((data && data.url_prefix) || 'agent') +
            '/messages/' +
            (data.sender_id || '') +
            '/' +
            (data.thread_code || '')
          : null) ||
        cfg.messagesUrl ||
        cfg.agentAppointmentsUrl ||
        '/agent/messages'
    );
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
      tag:
        'listify-' +
        ((data && data.type === 'chat' ? 'chat-' + (data.thread_code || Date.now()) : null) ||
          'enquiry-' + ((data && data.appointment_id) || Date.now())),
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

  function registerToken(reg) {
    if (!messagingRef || !messagingModRef) {
      return Promise.resolve();
    }

    // Guests: permission only. Token is saved after login.
    if (!cfg.canSaveToken) {
      console.log('[FCM] Permission ready; token will save after login');
      return Promise.resolve();
    }

    return messagingModRef
      .getToken(messagingRef, {
        vapidKey: cfg.vapidKey,
        serviceWorkerRegistration: reg,
      })
      .then(function (token) {
        if (token) {
          console.log('[FCM] Token length', token.length);
          return saveToken(token);
        }
        console.warn('[FCM] No token produced');
      });
  }

  function askPermissionAndRegister(fromUserClick) {
    if (setupStarted && !fromUserClick) {
      return;
    }
    setupStarted = true;

    var swUrl = cfg.serviceWorkerUrl || '/firebase-messaging-sw.js';
    console.log('[FCM] Registering SW', swUrl);

    navigator.serviceWorker
      .register(swUrl)
      .then(function (reg) {
        console.log('[FCM] SW scope', reg.scope);
        return waitActive(reg);
      })
      .then(function (reg) {
        var permission = Notification.permission;

        if (permission === 'granted') {
          console.log('[FCM] Permission granted');
          removePrompt();
          return registerToken(reg);
        }

        if (permission === 'denied') {
          console.warn('[FCM] Notifications blocked in browser settings');
          if (cfg.canSaveToken) {
            showBlockedHint();
          }
          return null;
        }

        // permission === 'default' — only request from a real user click
        if (!fromUserClick) {
          setupStarted = false;
          return null;
        }

        return Notification.requestPermission().then(function (p) {
          console.log('[FCM] Permission', p);
          if (p === 'granted') {
            removePrompt();
            return registerToken(reg);
          }
          if (p === 'denied' && cfg.canSaveToken) {
            showBlockedHint();
          }
          return null;
        });
      })
      .catch(function (err) {
        console.error('[FCM] Setup failed', err);
        setupStarted = false;
      });
  }

  function onPermissionFromSiteModal(permission) {
    console.log('[FCM] Site modal permission event:', permission);
    if (permission === 'granted') {
      removePrompt();
      setupStarted = false;
      askPermissionAndRegister(true);
    } else if (permission === 'denied' && cfg.canSaveToken) {
      showBlockedHint();
    }
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

    messagingModRef = messagingMod;
    messagingRef = messagingMod.getMessaging();

    // Foreground messages (logged-in users)
    if (cfg.canSaveToken) {
      messagingMod.onMessage(messagingRef, function (payload) {
        console.log('[FCM] Foreground push received', payload);
        if (typeof window.listifyRefreshNotificationCount === 'function') {
          window.listifyRefreshNotificationCount();
        }
        if (payload && payload.notification) {
          return;
        }
        var data = payload.data || {};
        showSystemNotification(data.title || 'Listify', data.body || '', data);
      });
    }

    // Listen to location modal "Allow Access" (same click → notification allow)
    document.addEventListener('listify-notification-permission', function (e) {
      var p = e && e.detail && e.detail.permission;
      if (p) {
        onPermissionFromSiteModal(p);
      }
    });
    window.listifyOnNotificationPermission = onPermissionFromSiteModal;

    var hasSiteModal =
      cfg.useSitePermissionModal &&
      !!document.getElementById('locationPermissionModal');

    if (Notification.permission === 'granted') {
      askPermissionAndRegister(false);
    } else if (Notification.permission === 'denied') {
      if (cfg.canSaveToken && !hasSiteModal) {
        showBlockedHint();
      }
    } else if (!hasSiteModal) {
      // No location modal on this page — keep fallback banner
      showPermissionPrompt();
    }
    // else: wait for locationPermissionModal Allow Access click
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
