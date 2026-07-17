/**
 * Geolocation Handler
 * Detects user's current location and stores it
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

            this.init();
        }

        init() {
            if (window.enableGeolocation === false) {
                return;
            }

            this.bindPermissionModalEvents();

            const cachedLocation = this.getCachedLocation();
            if (cachedLocation) {
                if (this.resolveDisplayText(cachedLocation)) {
                    this.updateLocationDisplay(cachedLocation);
                } else if (cachedLocation.latitude && cachedLocation.longitude) {
                    this.fetchAddress(cachedLocation.latitude, cachedLocation.longitude);
                }

                if (cachedLocation.latitude && cachedLocation.longitude) {
                    this.storeLocationOnServer(cachedLocation.latitude, cachedLocation.longitude);
                    this.triggerNearbyListingsFetch(cachedLocation.latitude, cachedLocation.longitude);
                }
                return;
            }

            if (this.isPromptDismissed()) {
                return;
            }

            this.startLocationFlow();
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

        async startLocationFlow() {
            const permission = await this.checkGeolocationPermission();

            if (permission === 'granted') {
                this.requestUserLocation();
                return;
            }

            if (permission === 'denied') {
                this.markPromptDismissed();
                return;
            }

            this.showLocationPermissionModal();
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
                this.requestUserLocation();
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

        handlePermissionAllow() {
            if (!navigator.geolocation) {
                console.warn('Geolocation is not supported by this browser');
                this.markPromptDismissed();
                this.hideLocationPermissionModal();
                return;
            }

            // Must request while the click gesture is still active.
            this.requestUserLocation();
            this.hideLocationPermissionModal();
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
