import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/js/all";
import "@fortawesome/fontawesome-free/css/all.css";
import "bootstrap"
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
