
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "results", "form" ]

  connect() {
    console.log("Connected!")
  }

  title() {
    console.log("2")
    Rails.fire(this.formTarget, 'submit')
  }

  handleResults() {
    console.log("1")
    const [data, status, xhr] = event.detail
    this.resultsTarget.innerHTML = xhr.response
  }
}
