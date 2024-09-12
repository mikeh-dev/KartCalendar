import mapboxgl from 'mapbox-gl';

document.addEventListener('turbo:load', () => {
    const mapElement = document.getElementById('map');
    const accessToken = mapElement.getAttribute('data-mapbox-token');

    mapboxgl.accessToken = accessToken;
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [-3.5, 54.5],  // Center on the UK
        zoom: 5,
        scrollZoom: false,  // Disable scroll zoom by default
        dragPan: false,     // Disable drag to pan
        dragRotate: false,  // Disable drag to rotate
        touchZoomRotate: false // Disable touch zoom and rotate
    });

    // Add expand control
    class ExpandControl {
        onAdd(map) {
            this._map = map;
            this._container = document.createElement('div');
            this._container.className = 'mapboxgl-ctrl mapboxgl-ctrl-group';
            this._container.innerHTML = `
                <button class="expand-btn" aria-label="Expand map">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" viewBox="0 0 24 24" fill="#3b82f6" stroke="#3b82f6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="15 3 21 3 21 9"></polyline>
                        <polyline points="9 21 3 21 3 15"></polyline>
                        <line x1="21" y1="3" x2="14" y2="10"></line>
                        <line x1="3" y1="21" x2="10" y2="14"></line>
                    </svg>
                </button>`;
            this._container.onclick = () => this.toggleExpand();
            this._expanded = false;
            return this._container;
        }

        onRemove() {
            this._container.parentNode.removeChild(this._container);
            this._map = undefined;
        }

        toggleExpand() {
            const mapContainer = this._map.getContainer();
            if (!this._expanded) {
                // Expand
                mapContainer.style.height = '500px';  // Adjust this value as needed
                this._map.resize();
                this._map.scrollZoom.enable();
                this._map.dragPan.enable();
                this._map.dragRotate.enable();
                this._map.touchZoomRotate.enable();
                this._expanded = true;
                this._container.querySelector('button').innerHTML = `
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" viewBox="0 0 24 24" fill="#3b82f6" stroke="#3b82f6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="4 14 10 14 10 20"></polyline>
                        <polyline points="20 10 14 10 14 4"></polyline>
                        <line x1="14" y1="10" x2="21" y2="3"></line>
                        <line x1="3" y1="21" x2="10" y2="14"></line>
                    </svg>`;
            } else {
                // Collapse
                mapContainer.style.height = '100px';  // Adjust this value to your original map height
                this._map.resize();
                this._map.scrollZoom.disable();
                this._map.dragPan.disable();
                this._map.dragRotate.disable();
                this._map.touchZoomRotate.disable();
                this._expanded = false;
                this._container.querySelector('button').innerHTML = `
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" viewBox="0 0 24 24" fill="#3b82f6" stroke="#3b82f6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="15 3 21 3 21 9"></polyline>
                        <polyline points="9 21 3 21 3 15"></polyline>
                        <line x1="21" y1="3" x2="14" y2="10"></line>
                        <line x1="3" y1="21" x2="10" y2="14"></line>
                    </svg>`;
            }
        }
    }

    map.addControl(new ExpandControl(), 'top-right');

    // Fetch track data from server
    fetch('/tracks.json')  // Ensure the URL matches your routes configuration
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(tracksData => {
            tracksData.forEach(track => {
                const popup = new mapboxgl.Popup({ offset: 5 }).setHTML(track.tooltip);
                new mapboxgl.Marker()
                    .setLngLat([track.longitude, track.latitude])
                    .setPopup(popup)
                    .addTo(map);
            });
        })
        .catch(error => console.error('Error loading track data:', error));
});