import 'bootstrap/dist/js/bootstrap';
import "bootstrap";
import "../plugins/flatpickr";
import { getProximity } from "../geolocation";
import { toggleStatus } from "../status";
import { buttonsColor } from "../btn_footer";


document.addEventListener("DOMContentLoaded", getProximity);
document.addEventListener("DOMContentLoaded", toggleStatus);
buttonsColor();
