import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["map", "list"];

  showList() {
    this.listTarget.classList.remove("hidden");
    this.mapTarget.classList.add("hidden");
  }

  showMap() {
    this.mapTarget.classList.remove("hidden");
    this.listTarget.classList.add("hidden");

  const mapElement = document.getElementById('map');
    if (mapElement && mapElement._map) {
      mapElement._map.resize(); // Resize the Mapbox map to fit the container
    }
  }
}