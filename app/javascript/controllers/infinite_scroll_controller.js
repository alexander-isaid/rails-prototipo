import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infinite-scroll"
export default class extends Controller {
  static targets = ["entries", "pagination"];

  connect() {
    if (this.hasPaginationTarget) {
      this.createObserver();
    }
  }

  createObserver() {
    let options = {
      root: null,
      rootMargin: "0px",
      threshold: 1.0
    };

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.loadMore();
        }
      });
    }, options);

    this.observer.observe(this.paginationTarget);
  }

  loadMore() {
    let nextPageLink = this.paginationTarget.querySelector("a[rel='next']");
    if (nextPageLink) {
      let url = nextPageLink.href;
      
      fetch(url, {
        headers: {
          "X-Requested-With": "XMLHttpRequest"
        }
      })
      .then(response => response.text())
      .then(html => {
        this.entriesTarget.insertAdjacentHTML("beforeend", html);
        this.paginationTarget.remove(); // Eliminamos la paginación para evitar múltiples cargas
      });
    }
  }
}