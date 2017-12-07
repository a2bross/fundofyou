function updatePrices(){
  // dynamically update prices
  document.getElementById("contribution").addEventListener("change", (event) => {
    document.querySelectorAll("amount").forEach((amount) => {
      amount.innerText = Math.round(document.getElementById("contribution").value / document.querySelectorAll(".tab-pane .checked").length)
    });
  });
}


function checked() {
  // dynamically update the checked class
  document.querySelectorAll(".tab-pane .fa-check-circle-o").forEach((element) => {
    element.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("checked");
      let val = event.currentTarget.firstChild.value
      event.currentTarget.firstChild.value(val === `${projectId}` ? "" : `${projectId}`);
      const projectId = event.currentTarget.dataset.contentCheck;
      const searchString = `[data-tab-check='${projectId}']`;
      const tabObject = document.querySelector(searchString);
      tabObject.classList.toggle("checked");
    });
  });
}

export { updatePrices, checked };
