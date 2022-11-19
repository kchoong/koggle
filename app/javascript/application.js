// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import Rails from '@rails/ujs';

// Other JS files
import "./layout";

Rails.start();