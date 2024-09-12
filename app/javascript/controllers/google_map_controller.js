import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="google-map"
export default class extends Controller {
  static targets = ['myMap']
  static values = {
    apiKey: String
  }

  connect() {
    if (typeof google === 'undefined') {
      this.loadGoogleMapsAPI()
    } else {
      this.initMap()
    }
  }

  loadGoogleMapsAPI() {
    const script = document.createElement('script')
    script.src = `https://maps.googleapis.com/maps/api/js?key=${this.apiKeyValue}&callback=initGoogleMap`
    document.head.appendChild(script)
    window.initGoogleMap = this.initMap.bind(this)
  }

  async initMap() {
    const position = { lat: 54.5, lng: -3.5 }  // Center on the UK
    const mapElement = this.myMapTarget

    const { Map } = await google.maps.importLibrary("maps")
    this.map = new Map(mapElement, {
      center: position,
      zoom: 5,
    })

    this.loadTracks()
  }

  loadTracks() {
    fetch('/tracks.json')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok')
        }
        return response.json()
      })
      .then(tracksData => {
        this.addMarkers(tracksData)
      })
      .catch(error => console.error('Error loading track data:', error))
  }

  addMarkers(tracks) {
    tracks.forEach(track => {
      const position = { lat: track.latitude, lng: track.longitude }
      const marker = new google.maps.Marker({
        position: position,
        map: this.map,
        title: track.name
      })

      const infoWindow = new google.maps.InfoWindow({
        content: track.tooltip
      })

      marker.addListener('click', () => {
        infoWindow.open(this.map, marker)
      })
    })
  }
}