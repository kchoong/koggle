// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import Rails from '@rails/ujs';
import {PageTitle} from "./layout";
import {DynamicTime} from "./date";

Rails.start();

// Dynamically set the page title
PageTitle.init();

// Dynamic display for dates
// DynamicTime.init();