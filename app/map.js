import mapboxgl from 'mapbox-gl';

document.addEventListener('DOMContentLoaded', () => {
    mapboxgl.accessToken = process.env.MAPBOX_ACCESS_TOKEN;
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [longitude, latitude],
        zoom: 10
    });

    new mapboxgl.Marker()
        .setLngLat([longitude, latitude])
        .addTo(map);
});