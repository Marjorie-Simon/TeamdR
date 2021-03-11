import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "H:i",
    minTime: "09:00",
    maxTime: "21:00",
    defaultDate: "today",
  });
};

const initFlatpickrDaschboard = () => {
  flatpickr(".graphdatepicker", {
    defaultDate: "today"
  });
};

export { initFlatpickr, initFlatpickrDaschboard };

// enableTime: true,
//     noCalendar: true,
//     dateFormat: "H:i",
//     minTime: "16:00",
//     maxTime: "22:30",
