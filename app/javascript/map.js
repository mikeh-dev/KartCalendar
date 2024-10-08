import mapboxgl from 'mapbox-gl';

document.addEventListener('turbo:load', () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const accessToken = mapElement.getAttribute('data-mapbox-token');

    mapboxgl.accessToken = accessToken;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-3.5, 54.5],
      zoom: 5,
      resize: true,
    });

    mapElement._map = map;

    fetch('/tracks.json')
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
  }
});