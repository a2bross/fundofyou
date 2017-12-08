function updatePrices(){
  // dynamically update prices
  document.getElementById("contribution").addEventListener("change", (event) => {
    updateAmount();
  });
}

function checked() {
  // dynamically update the checked class
  document.querySelectorAll(".tab-pane .fa-check-circle-o").forEach((element) => {
    // show element as clickable
    element.classList.add("clickable");
    //add event listener for clicks
    element.addEventListener("click", (event) => {
      // toggle the "checked" class on the tab content
      event.currentTarget.classList.toggle("checked");
      // toggle the "checked" class on the corresponding tab
      const projectId = event.currentTarget.dataset.contentCheck;
      const searchString = `[data-tab-check='${projectId}']`;
      const tabObject = document.querySelector(searchString);
      tabObject.classList.toggle("checked");
      // update amounts of all tab contents accordingly
      updateAmount();
      // toggle hidden class on contribution message of the current target
      event.currentTarget.parentNode.querySelectorAll(".contribution-amount").forEach((message) => {
        message.classList.toggle("hidden");
      });
      // update hidden field value project ids
      const hiddenFieldValue = event.currentTarget.firstChild.value;
      event.currentTarget.firstChild.value = hiddenFieldValue === projectId ? "" : projectId;
    });
  });
}

function updateAmount() {
  document.querySelectorAll(".amount").forEach((amount) => {
    const donation = document.getElementById("contribution").value / document.querySelectorAll(".tab-pane .checked").length
    amount.innerText = Math.round(donation * 100) / 100;
  });
}

export { updatePrices, checked, updateAmount };
