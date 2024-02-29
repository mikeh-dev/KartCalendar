import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["scrollTo"]

  scrollToElement() {
    this.scrollToTarget.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
  }
}
