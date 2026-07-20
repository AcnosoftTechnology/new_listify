# Listify Mobile App — Push Notification API

**Base URL:** `https://api.listify.asia/api`  
**Auth:** JWT Bearer token (same token from login)  
**Content-Type:** `application/json`

> Do **not** use `www.listify.asia` for these APIs.  
> Do **not** use `/api/auth/login` — that path is deprecated.

---

## 1. Login (get JWT)

```
POST /login
```

### Request
```json
{
  "email": "user@example.com",
  "password": "secret"
}
```

### Success `200`
```json
{
  "status": true,
  "token": "<JWT_ACCESS_TOKEN>",
  "user": {
    "id": 5,
    "name": "Abhishek",
    "email": "user@example.com",
    "role": "2",
    "is_agent": 1,
    "type": "agent"
  }
}
```

### Error `401`
```json
{
  "status": false,
  "message": "Invalid email or password"
}
```

### App requirement
- Save `token` securely (secure storage).
- Send it on all protected APIs as:

```
Authorization: Bearer <JWT_ACCESS_TOKEN>
```

---

## 2. Register FCM device token (required for push)

Call this **after login**, and again whenever Firebase refreshes the token.

```
POST /fcm/register
Authorization: Bearer <JWT>
```

### Request body
| Field | Type | Required | Description |
|--------|------|----------|-------------|
| `fcm_token` | string | Yes | Firebase Messaging token from the **current device** |
| `platform` | string | Yes | `android` \| `ios` \| `web` |
| `device_id` | string | No | Stable unique device id (recommended) |
| `device_label` | string | No | e.g. `Pixel 8`, `iPhone 15` |

### Example
```json
{
  "fcm_token": "dKx9...:APA91bH...",
  "platform": "android",
  "device_id": "android-unique-device-id",
  "device_label": "Pixel 8"
}
```

### Success `200`
```json
{
  "status": true,
  "user_id": 5,
  "platform": "android",
  "message": "FCM token registered. Device will receive enquiry, chat and order pushes."
}
```

### Errors
| Code | Meaning |
|------|---------|
| `401` | Missing/invalid JWT — login again |
| `422` | Validation failed (`fcm_token` / `platform`) |
| `503` | Server table missing (backend issue) |

### Important
- Token must come from **Firebase on that phone** (`firebase_messaging`).
- Postman cannot create a real device token.
- Without this call, the phone will **not** receive pushes.

---

## 3. Unregister token (on logout)

```
POST /fcm/unregister
Authorization: Bearer <JWT>
```

(Also accepts `DELETE /fcm/unregister`)

### Request body (one of these)
```json
{ "fcm_token": "dKx9...:APA91bH..." }
```
or
```json
{ "device_id": "android-unique-device-id" }
```

### Success `200`
```json
{
  "status": true,
  "deleted": 1
}
```

---

## 4. List registered devices (debug)

```
GET /fcm/devices
Authorization: Bearer <JWT>
```

### Success `200`
```json
{
  "status": true,
  "count": 1,
  "devices": [
    {
      "id": 12,
      "platform": "android",
      "device_id": "android-unique-device-id",
      "device_label": "Pixel 8",
      "token_preview": "dKx9abc…",
      "updated_at": "2026-07-18 12:00:00"
    }
  ]
}
```

---

## 5. Test push (QA only)

```
POST /fcm/test
Authorization: Bearer <JWT>
```

No body required.

### Success
```json
{
  "status": true,
  "reason": "sent",
  "message": "Test push sent — check your phone",
  "user_id": 5,
  "devices": 1
}
```

### Failure examples
```json
{
  "status": false,
  "reason": "no_tokens",
  "message": "No FCM token for this user — call /api/fcm/register first"
}
```

```json
{
  "status": false,
  "reason": "firebase_disabled",
  "message": "Firebase disabled on api.listify.asia — ..."
}
```

---

## 6. App integration flow

```
1. User opens app
2. POST /login  → save JWT
3. Get FCM token from Firebase SDK (this device)
4. POST /fcm/register with JWT + fcm_token + platform
5. On token refresh → POST /fcm/register again
6. On logout → POST /fcm/unregister
7. Handle incoming notification tap → navigate by payload.type
```

### Flutter (example)

```dart
// After successful login
final jwt = loginResponse['token'];

// Get device FCM token
final fcmToken = await FirebaseMessaging.instance.getToken();

await dio.post(
  'https://api.listify.asia/api/fcm/register',
  data: {
    'fcm_token': fcmToken,
    'platform': Platform.isIOS ? 'ios' : 'android',
    'device_id': deviceId, // from device_info_plus
    'device_label': deviceModel,
  },
  options: Options(headers: {
    'Authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  }),
);

// Refresh listener
FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
  // call /fcm/register again with newToken
});
```

---

## 7. Firebase setup (app side)

| Item | Value |
|------|--------|
| Firebase project | `listify-asia-firbase-api` (same as website) |
| Android package | `com.listify.asia` (must match Firebase console) |
| Android notification channel | `listify_default` (create in app) |
| Permissions | Android 13+: `POST_NOTIFICATIONS` |

### Android channel (required)
Create channel id exactly: **`listify_default`**

---

## 8. Notification payloads (server → app)

Har push ke **FCM `data`** me ye fields aati hain (redirect + tracking ke liye):

| Field | Description |
|--------|-------------|
| `type` | `enquiry` \| `chat` \| `order` \| `test` |
| `screen` | App screen key: `enquiry`, `chat`, `order`, `test`, `home` |
| `entity_id` | Main id (appointment_id / order_id / thread_code) |
| `sender_id` | User jisne action kiya (customer / message sender) — jahan available |
| `receiver_id` | Chat: jisko message mila |
| `title` | Notification title |
| `body` | Notification body |
| `click_action` | Web path (app deep link reference) |

App me pehle `data['type']` ya `data['screen']` se route karo; extra ids neeche.

Server sends FCM data for these events automatically after token is registered:

### Enquiry (new appointment)
| Key | Example |
|-----|---------|
| `type` | `enquiry` |
| `sender_id` | `12` (customer who sent enquiry) |
| `title` | New enquiry received |
| `body` | … |
| `appointment_id` | `123` |
| `listing_id` | `45` |
| `listing_type` | `restaurant` |
| `click_action` | `/agent/appointment` |

### Chat message
| Key | Example |
|-----|---------|
| `type` | `chat` |
| `title` | New message from … |
| `body` | message preview |
| `thread_code` | `abc123` |
| `sender_id` | `10` (who sent message) |
| `receiver_id` | `5` (who receives) |
| `url_prefix` | `agent` or `customer` |
| `click_action` | `/agent/messages/{sender_id}/{thread_code}` |

### Shop order
| Key | Example |
|-----|---------|
| `type` | `order` |
| `sender_id` | `12` (customer who placed order) |
| `title` | New shop order received |
| `body` | … |
| `order_id` | `99` |
| `listing_id` | `45` |
| `click_action` | `/agent/order-manager?order_id=99` |

### Test
| Key | Example |
|-----|---------|
| `type` | `test` |
| `click_action` | `/agent/appointment` |

### Navigation suggestion
```dart
void onNotificationTap(Map<String, dynamic> data) {
  final type = data['type'] ?? '';
  final screen = data['screen'] ?? type;

  switch (screen) {
    case 'enquiry':
      openEnquiry(appointmentId: data['appointment_id'] ?? data['entity_id']);
      break;
    case 'chat':
      openChat(
        threadCode: data['thread_code'] ?? data['entity_id'],
        senderId: data['sender_id'],
      );
      break;
    case 'order':
      openOrder(orderId: data['order_id'] ?? data['entity_id']);
      break;
    default:
      openHome();
  }

  // Analytics example: log event with type + entity_id
  // analytics.log('push_open', {'type': type, 'entity_id': data['entity_id']});
}
```

---

## 9. Endpoint summary

| Method | Endpoint | Auth | Purpose |
|--------|----------|------|---------|
| `POST` | `/api/login` | No | Get JWT |
| `POST` | `/api/fcm/register` | Bearer JWT | Save device FCM token |
| `POST` | `/api/fcm/unregister` | Bearer JWT | Remove token (logout) |
| `DELETE` | `/api/fcm/unregister` | Bearer JWT | Same as above |
| `GET` | `/api/fcm/devices` | Bearer JWT | Debug device list |
| `POST` | `/api/fcm/test` | Bearer JWT | Send test notification |

Full URLs:
- `https://api.listify.asia/api/login`
- `https://api.listify.asia/api/fcm/register`
- `https://api.listify.asia/api/fcm/unregister`
- `https://api.listify.asia/api/fcm/devices`
- `https://api.listify.asia/api/fcm/test`

---

## 10. Checklist for app developer

- [ ] Firebase project linked (Android + iOS if needed)
- [ ] Notification permission requested
- [ ] Android channel `listify_default` created
- [ ] Login uses `POST /api/login` and stores JWT
- [ ] After login → register FCM token
- [ ] `onTokenRefresh` → re-register
- [ ] Logout → unregister
- [ ] Handle notification tap by `type`
- [ ] QA with `/api/fcm/test` on a real device

---

## 11. Common mistakes

| Mistake | Result |
|---------|--------|
| Using `/api/auth/login` | 404 |
| Using `www.listify.asia` for FCM APIs | Wrong / missing routes |
| Missing `Authorization: Bearer` | 401 |
| Fake/Postman token | `test` may say sent, but no real phone toast |
| Skipping `/fcm/register` | No pushes on that device |
| Wrong Firebase project / package name | Invalid token / no delivery |

---

**Contact / backend owner:** Listify API team  
**Last updated:** July 2026
