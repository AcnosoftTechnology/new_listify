/**
 * Geolocation + Notification permission handler
 * Uses one site modal; Allow click triggers browser prompts for both.
 */

(function() {
    'use strict';

    class GeolocationHandler {
        constructor() {
            this.apiBaseUrl = window.apiBaseUrl || '/api';
            this.sessionStorageKey = 'user_geolocation';
            this.promptDismissedKey = 'listify_location_prompt_dismissed';
            this.locationCacheTime = 1000 * 60 * 60;
            this.csrfToken = document.querySelector('meta[name="csrf-token"]')?.content || '';
            this.permissionModal = null;
            this.geoOn = window.enableGeolocation !== false;
            this.notifOn = window.enableNotifications === true;

            this.init();
        }

        init() {
            if (!this.geoOn && !this.notifOn) {
                return;
            }

            this.bindPermissionModalEvents();

            const cachedLocation = this.getCachedLocation();
            if (cachedLocation && this.geoOn) {
                if (this.resolveDisplayText(cachedLocation)) {
                    this.updateLocationDisplay(cachedLocation);
                } else if (cachedLocation.latitude && cachedLocation.longitude) {
                    this.fetchAddress(cachedLocation.latitude, cachedLocation.longitude);
                }

                if (cachedLocation.latitude && cachedLocation.longitude) {
                    this.storeLocationOnServer(cachedLocation.latitude, cachedLocation.longitude);
                    this.triggerNearbyListingsFetch(cachedLocation.latitude, cachedLocation.longitude);
                }

                // Location already known — still ask notifications via same modal if needed
                this.maybeAskNotificationOnly();
                return;
            }

            if (this.isPromptDismissed()) {
                // Still register FCM if permission already granted
                if (this.notifOn && 'Notification' in window && Notification.permission === 'granted') {
                    this.emitNotificationPermission('granted');
                }
                return;
            }

            this.startPermissionFlow();
        }

        needsNotificationPrompt() {
            return this.notifOn
                && typeof Notification !== 'undefined'
                && Notification.permission === 'default';
        }

        maybeAskNotificationOnly() {
            if (!this.needsNotificationPrompt()) {
                if (this.notifOn && 'Notification' in window && Notification.permission === 'granted') {
                    this.emitNotificationPermission('granted');
                }
                return;
            }

            if (this.isPromptDismissed()) {
                return;
            }

            this.showLocationPermissionModal();
        }

        bindPermissionModalEvents() {
            const allowBtn = document.getElementById('location-permission-allow');
            const dismissBtn = document.getElementById('location-permission-dismiss');

            if (allowBtn) {
                allowBtn.addEventListener('click', () => this.handlePermissionAllow());
            }

            if (dismissBtn) {
                dismissBtn.addEventListener('click', () => this.handlePermissionDismiss());
            }
        }

        async startPermissionFlow() {
            const geoPermission = this.geoOn
                ? await this.checkGeolocationPermission()
                : 'granted';

            const needsNotif = this.needsNotificationPrompt();

            if (geoPermission === 'granted' && !needsNotif) {
                if (this.geoOn) {
                    this.requestUserLocation();
                }
                if (this.notifOn && 'Notification' in window && Notification.permission === 'granted') {
                    this.emitNotificationPermission('granted');
                }
                return;
            }

            if (geoPermission === 'denied' && !needsNotif) {
                this.markPromptDismissed();
                return;
            }

            // Show our modal so user click can open browser prompts (location and/or notifications)
            if (geoPermission === 'prompt' || needsNotif) {
                this.showLocationPermissionModal();
                return;
            }

            if (this.geoOn) {
                this.requestUserLocation();
            }
        }

        async checkGeolocationPermission() {
            if (!navigator.permissions || !navigator.permissions.query) {
                return 'prompt';
            }

            try {
                const result = await navigator.permissions.query({ name: 'geolocation' });
                return result.state;
            } catch (error) {
                return 'prompt';
            }
        }

        showLocationPermissionModal() {
            const modalEl = document.getElementById('locationPermissionModal');
            if (!modalEl || typeof bootstrap === 'undefined') {
                // Fallback without modal UI
                this.handlePermissionAllow();
                return;
            }

            this.permissionModal = bootstrap.Modal.getOrCreateInstance(modalEl);
            this.permissionModal.show();
        }

        hideLocationPermissionModal() {
            if (this.permissionModal) {
                this.permissionModal.hide();
            }
        }

        /**
         * Same user-gesture click must start both browser prompts.
         */
        handlePermissionAllow() {
            // 1) Notifications first (same click gesture — required by Chrome)
            this.requestNotificationPermission();

            // 2) Location
            if (this.geoOn && navigator.geolocation) {
                this.requestUserLocation();
            } else if (this.geoOn && !navigator.geolocation) {
                console.warn('Geolocation is not supported by this browser');
            }

            this.hideLocationPermissionModal();
        }

        requestNotificationPermission() {
            if (!this.notifOn || !('Notification' in window)) {
                return;
            }

            if (Notification.permission === 'granted') {
                this.emitNotificationPermission('granted');
                return;
            }

            if (Notification.permission === 'denied') {
                this.emitNotificationPermission('denied');
                return;
            }

            // Must be called directly from the click handler
            Notification.requestPermission()
                .then((permission) => {
                    console.log('[Permissions] Notification:', permission);
                    this.emitNotificationPermission(permission);
                })
                .catch((err) => {
                    console.warn('[Permissions] Notification request failed', err);
                });
        }

        emitNotificationPermission(permission) {
            document.dispatchEvent(new CustomEvent('listify-notification-permission', {
                detail: { permission: permission }
            }));

            if (typeof window.listifyOnNotificationPermission === 'function') {
                try {
                    window.listifyOnNotificationPermission(permission);
                } catch (e) {}
            }
        }

        handlePermissionDismiss() {
            this.markPromptDismissed();
            this.hideLocationPermissionModal();
        }

        isPromptDismissed() {
            return sessionStorage.getItem(this.promptDismissedKey) === '1';
        }

        markPromptDismissed() {
            sessionStorage.setItem(this.promptDismissedKey, '1');
        }

        requestUserLocation() {
            if (!navigator.geolocation) {
                console.warn('Geolocation is not supported by this browser');
                return;
            }

            navigator.geolocation.getCurrentPosition(
                (position) => this.handleLocationSuccess(position),
                (error) => this.handleLocationError(error),
                {
                    timeout: 10000,
                    enableHighAccuracy: false,
                    maximumAge: 0
                }
            );
        }

        handleLocationSuccess(position) {
            const { latitude, longitude } = position.coords;

            if (!this.validateCoordinates(latitude, longitude)) {
                this.handleLocationError({ message: 'Invalid coordinates' });
                return;
            }

            this.cacheLocation({ latitude, longitude });
            this.storeLocationOnServer(latitude, longitude);
            this.triggerNearbyListingsFetch(latitude, longitude);
            this.fetchAddress(latitude, longitude);
            this.ensureListingDistancesApplied(latitude, longitude);
        }

        handleLocationError(error) {
            console.warn('Geolocation error:', error.message);

            if (error.code === 1) {
                this.markPromptDismissed();
            }
        }

        fetchAddress(latitude, longitude) {
            fetch(`${this.apiBaseUrl}/location/address`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': this.csrfToken
                },
                body: JSON.stringify({ latitude, longitude })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success && data.data) {
                    const location = {
                        latitude,
                        longitude,
                        ...data.data,
                        timestamp: new Date().getTime()
                    };

                    sessionStorage.setItem(this.sessionStorageKey, JSON.stringify(location));
                    this.updateLocationDisplay(location);
                    this.triggerNearbyListingsFetch(latitude, longitude);
                }
            })
            .catch(error => console.error('Failed to fetch address:', error));
        }

        triggerNearbyListingsFetch(latitude, longitude) {
            window.setTimeout(() => {
                document.dispatchEvent(new CustomEvent('geolocation-updated', {
                    detail: { latitude, longitude }
                }));
            }, 0);
        }

        ensureListingDistancesApplied(latitude, longitude) {
            if (window.showDistance === false) {
                return;
            }

            window.setTimeout(() => {
                const hasListings = document.querySelector('[data-listing-id]');
                if (!hasListings || document.querySelector('.listing-distance-tag')) {
                    return;
                }

                this.triggerNearbyListingsFetch(latitude, longitude);
            }, 1500);
        }

        getDefaultAddress(element) {
            return element.getAttribute('data-default-location') || '';
        }

        resolveDisplayText(location) {
            if (location.address) {
                return location.address;
            }

            if (location.city) {
                return `${location.city}${location.country ? ', ' + location.country : ''}`;
            }

            return null;
        }

        updateLocationDisplay(location) {
            const locationElements = document.querySelectorAll('[data-location-display]');

            locationElements.forEach(element => {
                if (location.isDefault) {
                    const defaultAddress = this.getDefaultAddress(element);
                    if (defaultAddress) {
                        element.textContent = defaultAddress;
                        element.title = 'Using default location';
                    }
                    return;
                }

                const displayText = this.resolveDisplayText(location);
                if (!displayText) {
                    return;
                }

                element.textContent = displayText;
                element.title = displayText;
            });
        }

        cacheLocation(location) {
            sessionStorage.setItem(this.sessionStorageKey, JSON.stringify({
                ...location,
                timestamp: new Date().getTime()
            }));
        }

        getCachedLocation() {
            const cached = sessionStorage.getItem(this.sessionStorageKey);
            if (!cached) return null;

            const location = JSON.parse(cached);
            const age = new Date().getTime() - location.timestamp;

            if (age < this.locationCacheTime) {
                return location;
            }

            sessionStorage.removeItem(this.sessionStorageKey);
            return null;
        }

        storeLocationOnServer(latitude, longitude) {
            fetch(`${this.apiBaseUrl}/location/store`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': this.csrfToken
                },
                body: JSON.stringify({ latitude, longitude })
            })
            .then(response => response.json())
            .catch(error => console.warn('Failed to store location on server:', error));
        }

        validateCoordinates(latitude, longitude) {
            return typeof latitude === 'number' &&
                   typeof longitude === 'number' &&
                   latitude >= -90 &&
                   latitude <= 90 &&
                   longitude >= -180 &&
                   longitude <= 180;
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => new GeolocationHandler());
    } else {
        new GeolocationHandler();
    }

    window.GeolocationHandler = GeolocationHandler;
})();
