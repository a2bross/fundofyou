function updatePrices(){
  // dynamically update prices
  document.getElementById("contribution").addEventListener("change", (event) => {
    document.querySelectorAll(".amount").forEach((amount) => {
      amount.innerText = Math.round(document.getElementById("contribution").value / document.querySelectorAll(".tab-pane .checked").length)
    });
  });
}


function checked() {
  // dynamically update the checked class
  document.querySelectorAll(".tab-pane .fa-check-circle-o").forEach((element) => {
    // show element as clickable
    element.classList.add("clickable");
    //add event listener for clicks
    element.addEventListener("click", (event) => {
      // toggle the "checked" class
      event.currentTarget.classList.toggle("checked");
      const projectId = event.currentTarget.dataset.contentCheck;
      const searchString = `[data-tab-check='${projectId}']`;
      const tabObject = document.querySelector(searchString);
      tabObject.classList.toggle("checked");
      // update all amounts accordingly
      document.querySelectorAll(".amount").forEach((amount) => {
        amount.innerText = Math.round(document.getElementById("contribution").value / document.querySelectorAll(".tab-pane .checked").length);
      });
      // toggle hidden class on contribution message of the current target
      event.currentTarget.parentNode.querySelectorAll(".contribution-amount").forEach((message) => {
        message.classList.toggle("hidden");
      });
      // update hidden field value project ids
      const hiddenFieldValue = event.currentTarget.firstChild.value;
      console.log(hiddenFieldValue);
      event.currentTarget.firstChild.value = hiddenFieldValue === projectId ? "" : projectId;
    });
  });
}

export { updatePrices, checked };
