import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  displayTotal() {
    this.element.innerHTML += "hello";
    // this.contentTarget.insertAdjacentHTML("beforeend", "hello");
  }
}
