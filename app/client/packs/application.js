require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

require("../packs/components/Profile");
require("bootstrap");
import "bootstrap/dist/css/bootstrap";

let componentRequireContext = require.context("components", true);
let ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
