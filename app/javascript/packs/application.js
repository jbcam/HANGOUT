import 'bootstrap/dist/js/bootstrap';
import "bootstrap";
import "../plugins/flatpickr";
import "../channels/chatrooms";
import "../channels/messages";
import "../channels/read_messages";
import { getProximity } from "../geolocation";
import { toggleStatus } from "../status";

document.addEventListener("DOMContentLoaded", getProximity);
document.addEventListener("DOMContentLoaded", toggleStatus);
