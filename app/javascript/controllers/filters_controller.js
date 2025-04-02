import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  connect() {
    this.element.dataset.controller += " block-ui";
  }

  submit(event) {
    
    //this.element.requestSubmit()
  }

}
