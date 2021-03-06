// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chart.js")
require("chartkick")
// will be part of Chartkick.js 4.0
window.dispatchEvent(new Event("chartkick:load"));

// will be part of Chartkick.js 4.0
Chartkick.destroyAll = function() {
  for (var id in Chartkick.charts) {
    Chartkick.charts[id].destroy();
    delete Chartkick.charts[id];
  }
}
// to intialize tooltip on index user page
// $(function () {
// $('[data-toggle="tooltip"]').tooltip()
// })


// may be part of Chartkick.js 4.0 or may leave it to apps to add
document.addEventListener("turbolinks:before-render", function() {
  Chartkick.destroyAll();
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initFlatpickr, initFlatpickrDaschboard } from "../plugins/flatpickr";
import { initPopover } from "../plugins/init_popover";
import { initTooltip } from "../plugins/tooltip";
import { togglePopover} from "../components/toggle_popover";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initFlatpickr();
  initFlatpickrDaschboard();
  initPopover();
  initTooltip();
  // initSelect2();
  togglePopover();
  //Modal for rating
let modalBtn = document.getElementById("modal-btn")
let modal = document.querySelector(".modal")
let closeBtn = document.querySelector(".close-btn")
let backDrop = document.querySelector(".backdrop")
if (modalBtn && modal) {
modalBtn.onclick = function(){
  modal.style.display = "block"
  backDrop.style.display = "block"
}
}
  if(closeBtn && modal) {
closeBtn.onclick = function(){
  modal.style.display = "none"
  backDrop.style.display = "none"
}
}
window.onclick = function(e){
  if(e.target == modal){
    modal.style.display = "none"
    backDrop.style.display = "none"
  }
}

});



