
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["user", "modal", "tree"];

  modalUser(event) {
    let index = this.users.indexOf(event.currentTarget);
    let modal_user = this.modal[index];
    let team = this.tree[index];

    let user_name = document.getElementsByClassName("user_name")[index].innerText

    let modalController = this.application.getControllerForElementAndIdentifier(modal_user, "modal");
    let teamController = this.application.getControllerForElementAndIdentifier(team, "team");

    modalController.open();
    teamController.defaultTeam(user_name);
  }

  get users() {
    return new Array(...this.userTargets);
  }
  get modal() {
    return new Array(...this.modalTargets);
  }
  get tree() {
    return new Array(...this.treeTargets);
  }
}
