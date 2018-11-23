import 'bootstrap/dist/js/bootstrap';
import "bootstrap";
import { getProximity } from "../geolocation";
import { toggleStatus } from "../status";

document.addEventListener("DOMContentLoaded", getProximity);
document.addEventListener("DOMContentLoaded", toggleStatus);
