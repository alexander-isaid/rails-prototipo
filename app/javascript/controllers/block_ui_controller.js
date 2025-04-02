import { Controller } from "@hotwired/stimulus"
import $ from "jquery";

// Connects to data-controller="block-ui"
export default class extends Controller {
  connect() {
    const form = this.element;

    form.addEventListener("submit", (event) => {
      $.blockUI({
        message: "Procesando...", // Mensaje que se muestra
        css: {
          border: "none",
          padding: "15px",
          backgroundColor: "#000",
          color: "#fff",
          borderRadius: "5px",
        },
      });

      form.addEventListener("ajax:complete", () => {
        $.unblockUI();
      });

      form.addEventListener("ajax:error", () => {
        $.unblockUI();
      });
    });

  }
}
