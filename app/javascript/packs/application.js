import 'bootstrap/dist/js/bootstrap';
import "bootstrap";
import "../plugins/flatpickr";
import "../channels/chatrooms";
import "../channels/messages";
import "../channels/read_messages";
import { getProximity } from "../geolocation";
import { toggleStatus } from "../status";
import { buttonsColor } from "../btn_footer";
import { startSlide } from "../slider";


document.addEventListener("DOMContentLoaded", getProximity);
document.addEventListener("DOMContentLoaded", toggleStatus);
buttonsColor();
startSlide();
document.addEventListener("DOMContentLoaded", startSlide);

