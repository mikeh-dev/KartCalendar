import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
  }

  submit() {
    clearTimeout(this.timeout); // Clear any previous timeouts
    this.timeout = setTimeout(() => {
      this.element.requestSubmit(); // Submit the form after a 300ms debounce
    }, 300);
  }

  inputChanged(event) {
    if (event.target.value === "") {
      this.submit();
    }
  }
}
