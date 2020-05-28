import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// flatpickr(".datepicker", {
//   altInput: true,
//   enableTime: true
// });

flatpickr("#range_start", {
  altInput: true,
  enableTime: true,
  plugins: [new rangePlugin({ input: "#range_end"})]
});
