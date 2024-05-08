import mapboxgl from 'mapbox-gl';

document.addEventListener('DOMContentLoaded', () => {
    mapboxgl.accessToken = process.env.MAPBOX_ACCESS_TOKEN; // Use your Mapbox token
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [longitude, latitude], // Replace these with actual values
        zoom: 10,
        scrollZoom: true
    });

    new mapboxgl.Marker()
        .setLngLat([longitude, latitude]) // Replace these with actual values
        .addTo(map);
});