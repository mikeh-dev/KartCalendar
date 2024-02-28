import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar-populate"
export default class extends Controller {
  static values = {
    startDate: String,
    endDate: String
  }

  connect() {
    // Determine the fetch URL based on the current URL path
    let fetchUrl = window.location.pathname.includes('dashboard') ?
                   `/dashboard/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}` :
                   `/events/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}`;

    fetch(fetchUrl).then(response => {
        return response.json();
    }).then(json => {
        this.populateCalendarWithEvents(json);
    });
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