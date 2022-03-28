
import { Controller } from "stimulus"

export default class extends Controller {
  
  open() {
    document.body.classList.add("modal-open", "bg-gradient", "bg-light");
    this.element.setAttribute("style", "display: block;");
    this.element.classList.add("show");
  }

  close() {
      document.body.classList.remove("modal-open", "bg-gradient", "bg-light");
      this.element.removeAttribute("style");
      this.element.classList.remove("show");
  }
}
