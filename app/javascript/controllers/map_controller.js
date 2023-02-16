import { Controller } from "@hotwired/stimulus"
import { apply } from "ol-mapbox-style"

export default class extends Controller {
  static values = { url: String }

  connect() {
    apply(this.element, this.urlValue)
      .then((value) => { this.map = value })
  }

  disconnect() {
    this.map.setTarget(null)
    this.map = null
  }
}
