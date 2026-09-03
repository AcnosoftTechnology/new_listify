/**
 * Listing proximity: reorder cards and show distance badges site-wide
 */

(function() {
    'use strict';

    if (window.showDistance === false) {
        return;
    }

    const DISTANCE_ICON = `<svg class="listing-distance-tag__icon" width="13" height="13" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M17.1833 7.04166C16.3083 3.19166 12.95 1.45833 9.99996 1.45833C7.04996 1.45833 3.68329 3.18333 2.80829 7.03333C1.83329 11.3333 4.46662 14.975 6.84996 17.2667C7.73329 18.1167 8.86662 18.5417 9.99996 18.5417C11.1333 18.5417 12.2666 18.1167 13.1416 17.2667C15.525 14.975 18.1583 11.3417 17.1833 7.04166ZM9.99996 11.2167C8.54996 11.2167 7.37496 10.0417 7.37496 8.59166C7.37496 7.14166 8.54996 5.96666 9.99996 5.96666C11.45 5.96666 12.625 7.14166 12.625 8.59166C12.625 10.0417 11.45 11.2167 9.99996 11.2167Z" fill="currentColor"/></svg>`;

    function formatDistanceText(distance) {
        const km = parseFloat(distance);
        if (Number.isNaN(km)) {
            return null;
        }
        if (km < 1) {
            return `${Math.round(km * 1000)} m away`;
        }
        return `${km.toFixed(1)} km away`;
    }

    function buildDistanceTag(distance) {
        const text = formatDistanceText(distance);
        if (!text) {
            return null;
        }

        const tag = document.createElement('span');
        tag.className = 'listing-distance-tag';
        tag.title = 'Distance from your location';
        tag.innerHTML = `${DISTANCE_ICON}<span class="listing-distance-tag__text">${text}</span>`;
        return tag;
    }

    function applyDistanceTag(card, distance) {
        if (!card || distance === null || distance === undefined) {
            return;
        }

        const text = formatDistanceText(distance);
        if (!text) {
            return;
        }

        let tag = card.querySelector('.listing-distance-tag');

        if (!tag) {
            tag = buildDistanceTag(distance);
            const locationBlock = card.querySelector(
                '.location, .hotellist-title-location .location, .beautylist-location, .hotelgrid-location-rating .location, .restgrid-price-rating .location'
            );
            if (locationBlock && tag) {
                locationBlock.classList.add('align-items-center', 'flex-wrap', 'gap-1');
                locationBlock.appendChild(tag);
                return;
            }
            const titleArea = card.querySelector(
                '.cargrid-title-area, .hotel-grid-details, .hotel-list-details, .reals-grid-details, .single-grid-card'
            );
            if (titleArea && tag) {
                titleArea.appendChild(tag);
                return;
            }
        }

        const textEl = tag && tag.querySelector('.listing-distance-tag__text');
        if (textEl) {
            textEl.textContent = text;
        }
    }

    function getListingTypeFromUrl() {
        const match = window.location.pathname.match(/\/listing\/([^/]+)\/(grid|list)/i);
        return match ? match[1] : null;
    }

    function getListingTypeFromDetailUrl() {
        const match = window.location.pathname.match(/\/details\/([^/]+)\//i);
        return match ? match[1] : null;
    }

    function findListingCards() {
        return Array.from(document.querySelectorAll('[data-listing-id]'));
    }

    function findListingCardById(id) {
        return document.querySelector(`[data-listing-id="${id}"]`);
    }

    function parseListingDistance(item) {
        if (item.distance_km !== null && item.distance_km !== undefined) {
            return item.distance_km;
        }
        if (item.distance !== null && item.distance !== undefined) {
            const parsed = parseFloat(String(item.distance).replace(/[^\d.]/g, ''));
            return Number.isNaN(parsed) ? null : parsed;
        }
        return null;
    }

    class ListingProximityHandler {
        constructor() {
            this.apiBaseUrl = window.apiBaseUrl || '/api';
            this.csrfToken = document.querySelector('meta[name="csrf-token"]')?.content || '';
            this.featuredContainer = document.querySelector('#featured-listings-container');
            this.pendingUpdate = null;
            this.updateTimer = null;

            this.init();
        }

        init() {
            document.addEventListener('geolocation-updated', (event) => {
                this.scheduleGeolocationUpdate(event.detail.latitude, event.detail.longitude);
            });

            window.setTimeout(() => this.bootstrapFromStoredLocation(), 0);
        }

        bootstrapFromStoredLocation() {
            try {
                const cached = sessionStorage.getItem('user_geolocation');
                if (!cached) {
                    return;
                }

                const location = JSON.parse(cached);
                if (location.latitude != null && location.longitude != null) {
                    this.scheduleGeolocationUpdate(location.latitude, location.longitude);
                }
            } catch (error) {
                console.warn('Failed to bootstrap listing distances:', error);
            }
        }

        scheduleGeolocationUpdate(latitude, longitude) {
            this.pendingUpdate = { latitude, longitude };

            if (this.updateTimer) {
                window.clearTimeout(this.updateTimer);
            }

            this.updateTimer = window.setTimeout(() => {
                const update = this.pendingUpdate;
                this.pendingUpdate = null;
                this.updateTimer = null;

                if (update) {
                    this.handleGeolocationUpdate(update.latitude, update.longitude);
                }
            }, 100);
        }

        async handleGeolocationUpdate(latitude, longitude) {
            const distanceMap = new Map();

            try {
                if (this.featuredContainer) {
                    const featuredMap = await this.reorderFeaturedListings(latitude, longitude);
                    featuredMap.forEach((value, key) => distanceMap.set(key, value));
                }

                const pageType = getListingTypeFromUrl();
                if (pageType) {
                    const pageMap = await this.fetchListingDistances(latitude, longitude, pageType);
                    pageMap.forEach((value, key) => distanceMap.set(key, value));
                }

                if (distanceMap.size === 0 && findListingCards().length > 0) {
                    const fallbackMap = await this.fetchFeaturedFallbackDistances(latitude, longitude);
                    fallbackMap.forEach((value, key) => distanceMap.set(key, value));
                }

                this.applyDistanceMapToAllCards(distanceMap);
            } catch (error) {
                console.error('Error applying listing distances:', error);
            }
        }

        applyDistanceMapToAllCards(distanceMap) {
            findListingCards().forEach(card => {
                const id = String(card.dataset.listingId);
                if (distanceMap.has(id)) {
                    applyDistanceTag(card, distanceMap.get(id));
                }
            });
        }

        async reorderFeaturedListings(latitude, longitude) {
            const distanceMap = new Map();

            try {
                const response = await fetch(`${this.apiBaseUrl}/location/sorted-featured`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': this.csrfToken
                    },
                    body: JSON.stringify({ latitude, longitude })
                });

                if (!response.ok) {
                    return distanceMap;
                }

                const payload = await response.json();
                if (!payload.success || !payload.data) {
                    return distanceMap;
                }

                Object.entries(payload.data).forEach(([type, listings]) => {
                    listings.forEach(item => {
                        const km = parseListingDistance(item);
                        if (km !== null) {
                            distanceMap.set(String(item.id), km);
                        }
                    });
                    this.reorderTypeCards(type, listings);
                });
            } catch (error) {
                console.error('Error reordering featured listings:', error);
            }

            return distanceMap;
        }

        reorderTypeCards(type, sortedListings) {
            if (!this.featuredContainer) {
                return;
            }

            const cards = Array.from(
                this.featuredContainer.querySelectorAll(`[data-listing-type="${type}"]`)
            );

            if (!cards.length || !sortedListings.length) {
                return;
            }

            const cardMap = new Map();
            cards.forEach(card => {
                cardMap.set(String(card.dataset.listingId), card);
            });

            sortedListings.forEach(item => {
                const card = cardMap.get(String(item.id));
                if (card) {
                    this.featuredContainer.appendChild(card);
                    applyDistanceTag(card, parseListingDistance(item));
                }
            });
        }

        async fetchFeaturedFallbackDistances(latitude, longitude) {
            const distanceMap = new Map();
            const types = [...new Set(
                findListingCards()
                    .map(card => card.dataset.listingType)
                    .filter(Boolean)
            )];

            for (const type of types) {
                const typeMap = await this.fetchListingDistances(latitude, longitude, type);
                typeMap.forEach((value, key) => distanceMap.set(key, value));
            }

            return distanceMap;
        }

        async fetchListingDistances(latitude, longitude, type) {
            const distanceMap = new Map();

            try {
                const response = await fetch(`${this.apiBaseUrl}/location/nearby`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': this.csrfToken
                    },
                    body: JSON.stringify({
                        latitude,
                        longitude,
                        type,
                        radius: window.nearbyRadius || 500
                    })
                });

                if (!response.ok) {
                    return distanceMap;
                }

                const payload = await response.json();
                if (!payload.success || !payload.data) {
                    return distanceMap;
                }

                const container = document.querySelector('.row.row-28, .row.g-4, .mixitup2');

                payload.data.forEach(item => {
                    const km = parseListingDistance(item);
                    if (km === null) {
                        return;
                    }

                    distanceMap.set(String(item.id), km);

                    const card = findListingCardById(item.id);
                    if (card && container && container.contains(card)) {
                        container.appendChild(card);
                    }
                });
            } catch (error) {
                console.error('Error fetching listing distances:', error);
            }

            return distanceMap;
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => new ListingProximityHandler());
    } else {
        new ListingProximityHandler();
    }
})();
