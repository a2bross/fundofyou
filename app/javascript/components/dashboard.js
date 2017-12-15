const dashboardAreas = document.querySelectorAll(".clickable-area");
const areaFocus = document.querySelectorAll(".fixed-background");
if (dashboardAreas[0]) {
  dashboardAreas.forEach((area) => {
    area.addEventListener("click", (event) => {
      dashboardAreas.forEach((area) => { area.classList.remove("active")});
      event.currentTarget.classList.add("active");
      areaFocus.forEach((focus) => {focus.classList.add("hidden")});
      document.querySelector(`#${area.id}.fixed-background`).classList.remove("hidden");
    })
  })
}
