import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

<script
  type="text/javascript"
  src="https://app.termly.io/resource-blocker/58c10cd6-92f4-45f5-acd4-be2f48703bc5?autoBlock=on"
></script>

document.addEventListener("turbo:load", function(event) {
  window.dataLayer = window.dataLayer || []
  function gtag(){dataLayer.push(arguments)}
  gtag('js', new Date())
  gtag('config', 'G-2Q5VPDS4LY', {'page_location': event.detail.url})
}, false)