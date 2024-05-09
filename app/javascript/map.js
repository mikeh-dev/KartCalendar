import mapboxgl from 'mapbox-gl';

document.addEventListener('turbo:load', () => {
    const mapElement = document.getElementById('map');
    const accessToken = mapElement.getAttribute('data-mapbox-token');

    mapboxgl.accessToken = accessToken;
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [-3.5, 54.5],  // Center on the UK
        zoom: 5
    });

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
                const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(track.tooltip);
                new mapboxgl.Marker()
                    .setLngLat([track.longitude, track.latitude])
                    .setPopup(popup)
                    .addTo(map);
            });
        })
        .catch(error => console.error('Error loading track data:', error));
});
