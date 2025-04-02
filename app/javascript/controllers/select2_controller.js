import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import Select2 from "select2"

// Connects to data-controller="select2"
export default class extends Controller {

  connect() {
    this.initializeSelect2();
  }

  disconnect() {
    if (this.select2Instance) {
      this.select2Instance.destroy();
    }
  }

  initializeSelect2() {
    Select2();
    $('.content-search').select2(this.select2Options());
  }
  
  select2Options() {
    // Configura las opciones de Flatpickr aquí
    return {
      theme: 'bootstrap-5'
    }
  }
   

}
