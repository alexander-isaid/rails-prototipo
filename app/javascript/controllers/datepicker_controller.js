import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  connect() {
    this.flatpickrInstance = flatpickr(".flatpickr-config",this.flatpickrOptions());
    //this.initializeFlatpickr();
  }

  disconnect() {
    // if (this.flatpickrInstance) {
    //   this.flatpickrInstance.destroy();
    // }
  }

  initializeFlatpickr() {
    this.flatpickrInstance = flatpickr(".flatpickr-config",this.flatpickrOptions());
  }

  flatpickrOptions() {
    // Configura las opciones de Flatpickr aquí
    return {
      enableTime: false,
      dateFormat: "Y-m-d"
    };
  }

}
