import 'bootstrap/dist/js/bootstrap';
import "bootstrap";
import "../plugins/flatpickr";
import "../channels/chatrooms";
import "../channels/read_messages";
import { getProximity } from "../geolocation";
// import { toggleStatus } from "../status";
import { buttonsColor } from "../btn_footer";
import { tabColor } from "../tab";

document.addEventListener("DOMContentLoaded", getProximity);
//document.addEventListener("DOMContentLoaded", toggleStatus);
document.addEventListener("DOMContentLoaded", tabColor);
buttonsColor();
