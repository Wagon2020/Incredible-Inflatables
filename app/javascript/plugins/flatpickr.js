import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// flatpickr(".datepicker", {
//   altInput: true,
//   enableTime: true
// });

const initFlatpicker = () => {
  flatpickr("#range_start", {
    altInput: true,
    enableTime: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatpicker }
