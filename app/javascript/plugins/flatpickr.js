import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "H:i",
    minTime: "09:00",
    maxTime: "21:00",
    defaultDate: "today",
  });
  flatpickr(".graphdatepicker", {
    enableTime: false,
    dateFormat: "H:i",
    minTime: "09:00",
    maxTime: "21:00",
    defaultDate: "today",
  });
};

export { initFlatpickr };

// enableTime: true,
//     noCalendar: true,
//     dateFormat: "H:i",
//     minTime: "16:00",
//     maxTime: "22:30",
