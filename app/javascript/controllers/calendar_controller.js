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
      event.target.classList.add("bg-black")
      console.log(event.target)
    } else if (event.target.tagName == "DIV") {
      event.target.parentElement.classList.add("bg-black")
    } else {
      event.target.querySelector("time").classList.add("bg-black")
    }
    this.scrollToSection();
  }

  scrollToSection() {
    const targetSection = document.getElementById('calendar-section');
    if (targetSection) {
      targetSection.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  }

  clearDayTargets() {
    this.dayTargets.forEach(dayButton => {
      dayButton.classList.remove("bg-black")
    })
  }
}