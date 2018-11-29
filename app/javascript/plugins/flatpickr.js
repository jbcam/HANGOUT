import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

flatpickr(".datepicker", {
  minDate: "today",
  mode: "range",
  altInput: true,
  enableTime: true,
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
});
