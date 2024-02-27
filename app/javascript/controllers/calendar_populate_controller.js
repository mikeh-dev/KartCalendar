import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar-populate"
export default class extends Controller {
  static values = {
    startDate: String,
    endDate: String
  }

  connect() {
    fetch(
      `/events/check?start_date=${this.startDateValue}&end_date=${this.endDateValue}`
    ).then(response => {
      return response.json()
    }).then(json => {
      json.forEach(element => {
        if (element.events) {
          const div = document.createElement("div")
          div.classList.add("z-0", "w-2", "h-2", "rounded-full", "bg-indigo-500", "top-0", "ml-1", "left-0")
          this.element.querySelector(`time[datetime="${element.date}"]`).appendChild(div)
        }
      })
    })
  }
}