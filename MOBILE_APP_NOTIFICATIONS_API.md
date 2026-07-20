# Listify Mobile App — In-App Notifications API (Bell Icon)

**Base URL:** `https://api.listify.asia/api`  
**Auth:** JWT Bearer token (`POST /api/login`)  
**Content-Type:** `application/json`

Ye APIs **website header bell** jaisi hi notifications dikhati hain — same database table `notifications`.  
Jab enquiry / chat / order / push event hota hai, entry yahan bhi aati hai (FCM ke saath).

---

## 1. Login (JWT)

```
POST /login
```

```json
{ "email": "user@example.com", "password": "secret" }
```

Response se `token` save karo → har request me:

```
Authorization: Bearer <JWT>
```

---

## 2. Unread count (bell badge)

```
GET /app/notifications/unread-count
Authorization: Bearer <JWT>
```

### Response `200`

```json
{
  "status": true,
  "count": 3
}
```

App me bell badge = `count`.

---

## 3. Recent unread (bell dropdown — max 5)

Website bell jaisa: **sirf unread**, latest 5.

```
GET /app/notifications/recent
Authorization: Bearer <JWT>
```

### Response `200`

```json
{
  "status": true,
  "count": 3,
  "data": [
    {
      "id": 42,
      "title": "New message from Rahul",
      "body": "Hello, is this available?",
      "description": "Hello, is this available?",
      "is_read": false,
      "read_on": "0",
      "click_action": "/agent/messages/10/abc123thread",
      "media": null,
      "media_url": null,
      "created_at": "2026-07-20 10:15:00",
      "updated_at": null
    }
  ]
}
```

**App flow:** Bell open → `GET /recent` → list render.  
Read ke baad item bell list se hata do (server pe `read_on=1`).

---

## 4. Full list (Notifications screen)

```
GET /app/notifications?filter=all&page=1&per_page=20
Authorization: Bearer <JWT>
```

| Query | Values | Default |
|--------|--------|---------|
| `filter` | `all` \| `unread` | `all` |
| `page` | 1, 2, … | 1 |
| `per_page` | 1–50 | 20 |

### Response `200`

```json
{
  "status": true,
  "filter": "all",
  "unread_count": 2,
  "pagination": {
    "current_page": 1,
    "per_page": 20,
    "total": 45,
    "last_page": 3
  },
  "data": [ /* same item shape as /recent */ ]
}
```

Empty list pe bhi `status: true`, `data: []` (404 nahi).

---

## 5. Mark one as read

User ne notification open / tap kiya:

```
POST /app/notifications/{id}/read
Authorization: Bearer <JWT>
```

Body: empty.

### Response `200`

```json
{
  "status": true,
  "message": "Notification marked as read",
  "unread_count": 2
}
```

Bell list se wo item hata dena + badge `unread_count` update.

---

## 6. Mark all as read

```
POST /app/notifications/read-all
Authorization: Bearer <JWT>
```

### Response `200`

```json
{
  "status": true,
  "message": "All notifications marked as read",
  "updated": 5,
  "unread_count": 0
}
```

---

## 7. Deep link / navigation

Har item me `click_action` (agar hai) — relative web path, app me screen map karo:

| Event (push `type`) | Typical `click_action` | App screen |
|---------------------|-------------------------|------------|
| `chat` | `/agent/messages/{sender_id}/{thread_code}` | Chat thread |
| `enquiry` | `/agent/appointment` | Enquiries |
| `order` | `/agent/order-manager?order_id=99` | Order detail |

FCM push ke `data.type` + `click_action` ke saath align rakho.

---

## 8. Realtime sync with push (recommended)

```
1. FCM message received (foreground/background tap)
2. GET /app/notifications/unread-count  → update badge
3. If bell open → GET /app/notifications/recent → refresh list
4. On item tap → POST /app/notifications/{id}/read → navigate(click_action)
```

Pehle register FCM: `POST /api/fcm/register` (see `MOBILE_PUSH_API.md`).

---

## 9. Endpoint summary

| Method | Endpoint | Purpose |
|--------|----------|---------|
| `POST` | `/api/login` | JWT |
| `GET` | `/api/app/notifications/unread-count` | Bell badge |
| `GET` | `/api/app/notifications/recent` | Bell dropdown (unread ×5) |
| `GET` | `/api/app/notifications` | Full list + pagination |
| `POST` | `/api/app/notifications/{id}/read` | Mark read |
| `POST` | `/api/app/notifications/read-all` | Mark all read |

---

## 10. Legacy APIs (avoid for new app)

Purane app versions `X-API-KEY` use karte hain — nayi app **mat** use kare:

| Old | Issue |
|-----|--------|
| `POST /api/my-notifications` | `api.key` only, no JWT |
| `POST /api/my-notifications/view/{id}` | Same |

Nayi development: **`/api/app/notifications/*` + JWT** only.

---

## 11. Errors

| HTTP | Meaning |
|------|---------|
| `401` | Missing/invalid JWT |
| `403` | Dusre user ki notification |
| `404` | Invalid notification id |

---

## 12. Flutter example

```dart
final dio = Dio(BaseOptions(
  baseUrl: 'https://api.listify.asia/api',
  headers: {'Authorization': 'Bearer $jwt', 'Accept': 'application/json'},
));

// Badge
final countRes = await dio.get('/app/notifications/unread-count');
final badge = countRes.data['count'];

// Bell list
final recent = await dio.get('/app/notifications/recent');
final items = recent.data['data'] as List;

// Mark read on tap
await dio.post('/app/notifications/${item['id']}/read');
```

---

**Listify API Team · July 2026**
