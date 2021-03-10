const togglePopover = () => {
  const toggleButtons = document.querySelectorAll(".toggle_popover")
  if (toggleButtons) {
    toggleButtons.forEach((button) => {
    button.addEventListener("click",(e) => {
  const popover = e.currentTarget.parentElement.nextElementSibling;
   popover.classList.toggle("display_none");
    });
    });
  };
};
export {togglePopover}