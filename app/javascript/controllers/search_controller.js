import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];
  position = 0;

  connect() {
    // Save cursor position before Turbo renders new content and restore it after
    document.addEventListener('turbo:before-render', this.saveCursorPosition.bind(this));
    document.addEventListener('turbo:render', this.restoreCursorPosition.bind(this));
  }

  submit() {
    clearTimeout(this.timeout); // Clear any previous timeouts
    this.timeout = setTimeout(() => {
      this.element.requestSubmit(); // Submit the form after a 300ms debounce
    }, 300);
  }

  inputChanged(event) {
    // Automatically submit when input is cleared
    if (event.target.value === "") {
      this.submit();
    }
  }

  saveCursorPosition() {
    // Save the current cursor position in the input field
    if (this.inputTarget) {
      this.position = this.inputTarget.selectionStart;
    }
  }

  restoreCursorPosition() {
    // Restore the saved cursor position and refocus the input
    if (this.inputTarget && this.position !== null) {
      this.inputTarget.setSelectionRange(this.position, this.position);
      this.inputTarget.focus();
    }
  }
}
