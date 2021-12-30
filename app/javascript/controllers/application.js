import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()

// Configure Stimulus development experience
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))
