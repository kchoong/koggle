// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import Rails from '@rails/ujs';
import {PageTitle} from "./layout";
import {DynamicTime} from "./date";
import {Calendar} from "./dashboard";

Rails.start();

// Dynamically set the page title
PageTitle.init();

// Dynamic display for dates
// DynamicTime.init();

Calendar.init();