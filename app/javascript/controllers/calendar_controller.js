import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["day"]

  connect() {
    console.log("Connected!")
  }

  clickLink(event) {
    console.log(event)
    this.clearDayTargets()
    if (event.target.tagName == "TIME") {
      event.target.classList.add("bg-white", "font-semibold", "text-black")
      console.log(event.target)
    } else if (event.target.tagName == "DIV") {
      event.target.parentElement.classList.add("bg-white", "font-semibold", "text-black")
    } else {
      event.target.querySelector("time").classList.add("bg-white", "font-semibold", "text-black")
    }
  }

  clearDayTargets() {
    this.dayTargets.forEach(dayButton => {
      dayButton.classList.remove("bg-white")
      dayButton.classList.remove("font-semibold")
      dayButton.classList.remove("text-black")
    })
  }
}