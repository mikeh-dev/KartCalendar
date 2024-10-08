import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar-populate"
export default class extends Controller {
  static values = {
    startDate: String,
    endDate: String
  }

  connect() {
    let fetchUrl = "";
  
    // Check if the URL includes 'dashboard'
    if (window.location.pathname.includes('/dashboard')) {
      fetchUrl = `/dashboard/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}`;
    } 
    // Check if the URL is for the events index
    else if (window.location.pathname === '/events' || window.location.pathname === '/events/') {
      fetchUrl = `/events/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}`;
    } 
  
    // Only proceed if fetchUrl was set
    if (fetchUrl) {
      fetch(fetchUrl)
        .then(response => response.json())
        .then(json => this.populateCalendarWithEvents(json))
        .catch(error => console.error('Error fetching events:', error));
    } else {
      console.log("No appropriate fetch URL determined based on the current path:", window.location.pathname);
    }
  }

populateCalendarWithEvents(json) {
    json.forEach(element => {
        if (element.events) {
            const div = document.createElement("div");
            div.classList.add("z-0", "w-2", "h-2", "rounded-full", "bg-indigo-500", "top-0", "ml-1", "left-0");
            this.element.querySelector(`time[datetime="${element.date}"]`).appendChild(div);
        }
    });
}
}