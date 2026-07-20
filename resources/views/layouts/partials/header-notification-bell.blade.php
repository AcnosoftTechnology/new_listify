@auth
    @if(auth()->user()->role != 1)
        @php
            $uid = (string) user('id');
            $notificationCount = App\Models\Notifications::where('user_id', $uid)
                ->whereIn('read_on', [0, '0'])
                ->count();
            $latestNotifications = App\Models\Notifications::where('user_id', $uid)
                ->orderByDesc('id')
                ->take(5)
                ->get();
        @endphp
        <li class="have-sub-menu">
            <a href="javascript:void(0);" class="first-a top_noti" aria-label="{{ get_phrase('Notifications') }}">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C10.3431 2 9 3.34315 9 5V6.26505C6.19124 7.15004 4.25 9.82885 4.25 13V17L3 18.25V19H21V18.25L19.75 17V13C19.75 9.82885 17.8088 7.15004 15 6.26505V5C15 3.34315 13.6569 2 12 2Z" stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M14 21C14 22.1046 13.1046 23 12 23C10.8954 23 10 22.1046 10 21" stroke="#99A1B7" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <span id="header-notification-count">{{ $notificationCount }}</span>
            </a>
            <ul class="first-sub-menu">
                @forelse($latestNotifications as $notification)
                    @php
                        $isUnread = in_array($notification->read_on, [0, '0'], true);
                        $lines = preg_split("/\r\n|\n|\r/", (string) $notification->description);
                        $href = route('customer.notification');
                        if (is_array($lines) && count($lines) > 1 && str_starts_with(trim($lines[count($lines) - 1]), '/')) {
                            $href = url(trim($lines[count($lines) - 1]));
                        }
                    @endphp
                    <li>
                        <a href="{{ $href }}"
                           class="first-a header-notification-item p-2 d-block {{ $isUnread ? 'fw-semibold' : '' }}"
                           data-id="{{ $notification->id }}"
                           data-mark-read-url="{{ route('customer.notification.read') }}"
                           style="color:#242d3d;">
                            <div class="head_notification_list d-flex align-items-center gap-2">
                                <img src="{{ asset('assets/notification-bell.png') }}"
                                     alt=""
                                     style="border-radius: 5px; object-fit: cover; height: 30px; width: 30px;"
                                     onerror="this.src='https://www.listify.asia/public/assets/notification-bell.png'">
                                <span>{{ Str::limit($notification->title, 40) }}</span>
                            </div>
                        </a>
                    </li>
                @empty
                    <li><p style="margin:0; padding:5px;">{{ get_phrase('No notifications') }}</p></li>
                @endforelse
                <li><a class="mt-2 text-center d-block" href="{{ route('customer.notification') }}">{{ get_phrase('View All') }}</a></li>
            </ul>
        </li>
    @endif
@endauth

@once
    @push('js')
        <script>
            (function () {
                function setHeaderNotificationCount(count) {
                    var el = document.getElementById('header-notification-count');
                    if (el) {
                        el.textContent = String(Math.max(0, parseInt(count, 10) || 0));
                    }
                }

                window.listifyRefreshNotificationCount = function () {
                    fetch('{{ route('customer.notification.count') }}', {
                        credentials: 'same-origin',
                        headers: { 'Accept': 'application/json', 'X-Requested-With': 'XMLHttpRequest' }
                    })
                        .then(function (r) { return r.json(); })
                        .then(function (data) {
                            if (data && typeof data.count !== 'undefined') {
                                setHeaderNotificationCount(data.count);
                            }
                        })
                        .catch(function () {});
                };

                document.addEventListener('click', function (e) {
                    var link = e.target.closest('.header-notification-item');
                    if (!link) {
                        return;
                    }
                    e.preventDefault();
                    var id = link.getAttribute('data-id');
                    var markUrl = link.getAttribute('data-mark-read-url');
                    var target = link.getAttribute('href');
                    if (!id || !markUrl) {
                        window.location.href = target || '{{ route('customer.notification') }}';
                        return;
                    }
                    fetch(markUrl + '?id=' + encodeURIComponent(id), {
                        credentials: 'same-origin',
                        headers: { 'Accept': 'application/json', 'X-Requested-With': 'XMLHttpRequest' }
                    })
                        .then(function (r) { return r.json(); })
                        .then(function (res) {
                            if (res && res.success) {
                                var el = document.getElementById('header-notification-count');
                                if (el) {
                                    var n = parseInt(el.textContent, 10) || 0;
                                    setHeaderNotificationCount(n - 1);
                                }
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
