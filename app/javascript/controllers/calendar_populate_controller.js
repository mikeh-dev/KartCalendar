import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar-populate"
export default class extends Controller {
  static values = {
    startDate: String,
    endDate: String
  }

  connect() {
    console.log("CalendarPopulateController connected");
    console.log("Fetching events from:", `/events/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}`);

    fetch(`/events/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(json => {
        console.log("Events data received:", json);
          json.forEach(element => {
            console.log(`Processing date: ${element.date} Has events: ${element.events}`);
            if (element.events) {
              console.log(`Event indicator added for: ${element.date}`);
              const dayElement = this.element.querySelector(`time[datetime="${element.date}"]`);
              console.log(dayElement); // Debug: Ensure this is not null and correctly selected
              if (dayElement) {
                const div = document.createElement("div");
                div.classList.add("z-0", "w-2", "h-2", "rounded-full", "bg-indigo-500", "top-0", "ml-1", "left-0");
                dayElement.appendChild(div);
              }
            }
        });
      })
      .catch(error => {
        console.error("Failed to fetch events:", error);
      });
  }
}
