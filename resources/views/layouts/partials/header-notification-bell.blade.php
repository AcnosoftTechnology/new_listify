@auth
    @if(auth()->user()->role != 1)
        @php
            $uid = (string) user('id');
            $notificationCount = App\Models\Notifications::where('user_id', $uid)
                ->whereIn('read_on', [0, '0'])
                ->count();
            $latestNotifications = App\Models\Notifications::where('user_id', $uid)
                ->whereIn('read_on', [0, '0'])
                ->orderByDesc('id')
                ->take(5)
                ->get();
            $bellIcon = asset('assets/notification-bell.png');
            $markReadUrl = route('customer.notification.read');
            $viewAllUrl = route('customer.notification');
            $noNewLabel = get_phrase('No new notifications');
        @endphp
        <li class="have-sub-menu" id="header-notification-wrap">
            <a href="javascript:void(0);" class="first-a top_noti" aria-label="{{ get_phrase('Notifications') }}">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C10.3431 2 9 3.34315 9 5V6.26505C6.19124 7.15004 4.25 9.82885 4.25 13V17L3 18.25V19H21V18.25L19.75 17V13C19.75 9.82885 17.8088 7.15004 15 6.26505V5C15 3.34315 13.6569 2 12 2Z" stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M14 21C14 22.1046 13.1046 23 12 23C10.8954 23 10 22.1046 10 21" stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <span id="header-notification-count">{{ $notificationCount }}</span>
            </a>
            <ul class="first-sub-menu" id="header-notification-menu"
                data-recent-url="{{ route('customer.notification.recent') }}"
                data-mark-read-url="{{ $markReadUrl }}"
                data-bell-icon="{{ $bellIcon }}"
                data-view-all-url="{{ $viewAllUrl }}"
                data-empty-label="{{ $noNewLabel }}">
                @forelse($latestNotifications as $notification)
                    @php
                        $href = $notification->clickActionUrl($viewAllUrl);
                    @endphp
                    <li class="header-notification-row" data-notification-id="{{ $notification->id }}">
                        <a href="{{ $href }}"
                           class="first-a header-notification-item p-2 d-block fw-semibold"
                           data-id="{{ $notification->id }}"
                           data-mark-read-url="{{ $markReadUrl }}"
                           style="color:#242d3d;">
                            <div class="head_notification_list d-flex align-items-center gap-2">
                                <img src="{{ $bellIcon }}" alt="" style="border-radius: 5px; object-fit: cover; height: 30px; width: 30px;"
                                     onerror="this.src='https://www.listify.asia/public/assets/notification-bell.png'">
                                <span>{{ Str::limit($notification->title, 40) }}</span>
                            </div>
                        </a>
                    </li>
                @empty
                    <li class="header-notification-empty"><p style="margin:0; padding:5px;">{{ $noNewLabel }}</p></li>
                @endforelse
                <li class="header-notification-view-all"><a class="mt-2 text-center d-block" href="{{ $viewAllUrl }}">{{ get_phrase('View All') }}</a></li>
            </ul>
        </li>
    @endif
@endauth

@once
    @push('js')
        <script>
            (function () {
                var menu = document.getElementById('header-notification-menu');
                if (!menu) {
                    return;
                }

                var recentUrl = menu.getAttribute('data-recent-url');
                var defaultMarkRead = menu.getAttribute('data-mark-read-url');
                var bellIcon = menu.getAttribute('data-bell-icon');
                var viewAllUrl = menu.getAttribute('data-view-all-url');
                var emptyLabel = menu.getAttribute('data-empty-label') || 'No new notifications';

                function setHeaderNotificationCount(count) {
                    var el = document.getElementById('header-notification-count');
                    if (el) {
                        el.textContent = String(Math.max(0, parseInt(count, 10) || 0));
                    }
                }

                function escapeHtml(text) {
                    var d = document.createElement('div');
                    d.textContent = text || '';
                    return d.innerHTML;
                }

                function renderNotificationMenu(items) {
                    menu.querySelectorAll('.header-notification-row, .header-notification-empty').forEach(function (el) {
                        el.remove();
                    });

                    var viewAll = menu.querySelector('.header-notification-view-all');
                    if (!items || !items.length) {
                        var emptyLi = document.createElement('li');
                        emptyLi.className = 'header-notification-empty';
                        emptyLi.innerHTML = '<p style="margin:0; padding:5px;">' + escapeHtml(emptyLabel) + '</p>';
                        menu.insertBefore(emptyLi, viewAll);
                        return;
                    }

                    items.forEach(function (item) {
                        var li = document.createElement('li');
                        li.className = 'header-notification-row';
                        li.setAttribute('data-notification-id', item.id);
                        var title = escapeHtml(item.title);
                        var href = escapeHtml(item.href || viewAllUrl);
                        li.innerHTML =
                            '<a href="' + href + '" class="first-a header-notification-item p-2 d-block fw-semibold" ' +
                            'data-id="' + item.id + '" data-mark-read-url="' + defaultMarkRead + '" style="color:#242d3d;">' +
                            '<div class="head_notification_list d-flex align-items-center gap-2">' +
                            '<img src="' + bellIcon + '" alt="" style="border-radius:5px;object-fit:cover;height:30px;width:30px;">' +
                            '<span>' + title + '</span></div></a>';
                        menu.insertBefore(li, viewAll);
                    });
                }

                window.listifyRefreshNotificationBell = function () {
                    if (!recentUrl) {
                        return Promise.resolve();
                    }
                    return fetch(recentUrl, {
                        credentials: 'same-origin',
                        headers: { 'Accept': 'application/json', 'X-Requested-With': 'XMLHttpRequest' }
                    })
                        .then(function (r) { return r.json(); })
                        .then(function (data) {
                            if (!data || !data.success) {
                                return;
                            }
                            if (typeof data.count !== 'undefined') {
                                setHeaderNotificationCount(data.count);
                            }
                            renderNotificationMenu(data.items || []);
                        })
                        .catch(function () {});
                };

                window.listifyRefreshNotificationCount = function () {
                    return window.listifyRefreshNotificationBell();
                };

                document.addEventListener('click', function (e) {
                    var bell = e.target.closest('.top_noti');
                    if (bell && document.getElementById('header-notification-wrap')) {
                        window.listifyRefreshNotificationBell();
                    }
                });

                document.addEventListener('click', function (e) {
                    var link = e.target.closest('.header-notification-item');
                    if (!link) {
                        return;
                    }
                    e.preventDefault();
                    var id = link.getAttribute('data-id');
                    var markUrl = link.getAttribute('data-mark-read-url') || defaultMarkRead;
                    var target = link.getAttribute('href');
                    if (!id || !markUrl) {
                        window.location.href = target || viewAllUrl;
                        return;
                    }
                    fetch(markUrl + '?id=' + encodeURIComponent(id), {
                        credentials: 'same-origin',
                        headers: { 'Accept': 'application/json', 'X-Requested-With': 'XMLHttpRequest' }
                    })
                        .then(function (r) { return r.json(); })
                        .then(function (res) {
                            if (res && res.success) {
                                var row = link.closest('.header-notification-row');
                                if (row) {
                                    row.remove();
                                }
                                if (!menu.querySelector('.header-notification-row')) {
                                    var empty = menu.querySelector('.header-notification-empty');
                                    if (!empty) {
                                        var li = document.createElement('li');
                                        li.className = 'header-notification-empty';
                                        li.innerHTML = '<p style="margin:0; padding:5px;">' + escapeHtml(emptyLabel) + '</p>';
                                        var viewAllLi = menu.querySelector('.header-notification-view-all');
                                        menu.insertBefore(li, viewAllLi);
                                    }
                                }
                                window.listifyRefreshNotificationBell();
                            }
                            window.location.href = target;
                        })
                        .catch(function () {
                            window.location.href = target;
                        });
                });
            })();
        </script>
    @endpush
@endonce
