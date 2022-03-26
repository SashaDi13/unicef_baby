
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["team_count", "modal_user", "team"];
  static classes = ["hidden", "right", "down"];

  defaultTeam(user_name) {
    const users = [];

    this.modalUsers.forEach((user) => {
      if (user_name == user.getElementsByClassName("user-name")[0].innerText) {
        users.push(user);
      }

      if (this.teamCounter[this.modalUsers.indexOf(user)].innerText == "") {
        user.getElementsByClassName(this.rightClass)[0].setAttribute("data-icon", "caret-down");
      }
    });

    this.teams[this.modalUsers.indexOf(users[users.length - 1])].classList.remove("hidden");
    this.modalUsers[this.modalUsers.indexOf(users[users.length - 1])].getElementsByClassName(this.rightClass)[0].setAttribute("data-icon", "caret-down");
  }

  toggleTeam() {
    this.teams[this.modalUsers.indexOf(event.currentTarget)].classList.toggle("hidden");

    if (this.teamCounter[this.modalUsers.indexOf(event.currentTarget)].innerText != "") {

      if (event.currentTarget.getElementsByClassName(this.rightClass)[0]) {
        event.currentTarget.getElementsByClassName(this.rightClass)[0].setAttribute("data-icon", "caret-down");
      } else {
        event.currentTarget.getElementsByClassName(this.downClass)[0].setAttribute("data-icon", "caret-right");
      }

    }
  }

  get modalUsers() {
    return new Array(...this.modal_userTargets);
  }

  get teams() {
    return new Array(...this.teamTargets);
  }

  get teamCounter() {
    return new Array(...this.team_countTargets);
  }
}
