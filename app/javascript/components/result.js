function updateAmount() {
  document.querySelectorAll(".result-contribution").forEach((amount) => {
    const donation = document.getElementById("contribution").value / document.querySelectorAll(".result-checked").length
    amount.innerText = Math.round(donation * 100) / 100;
  });
}

function updatePrices(){
  // dynamically update prices
  document.getElementById("contribution").addEventListener("change", (event) => {
    updateAmount();
  });
};

// Initialize the focus
const resultCards = document.querySelectorAll(".result-card");
const projectFocus = document.querySelectorAll(".fixed-background");
const resultChoices = document.querySelectorAll(".result-choice");
const noProject = document.getElementById('no-project');
if (resultCards[0]) {
  updateAmount();
  updatePrices();
  resultCards[0].classList.add("card-focus");
  projectFocus[0].classList.remove("hidden");
  resultCards.forEach((card) => {
    card.addEventListener("click", (event) => {
      resultCards.forEach((card) => { card.classList.remove("card-focus") });
      event.currentTarget.classList.add("card-focus");
      projectFocus.forEach((focus) => { focus.classList.add("hidden") });
      const id = document.querySelector(".card-focus input").value;
      document.getElementById(id).classList.remove("hidden");
    });
  });
  resultChoices.forEach((result) => {
    result.addEventListener("click", (event) => {
      noProject.classList.add("hidden");
      event.currentTarget.classList.toggle("result-checked")
      event.currentTarget.parentElement.querySelector(".bullet").classList.toggle("hidden");
      updateAmount();
    })
  })

  document.querySelectorAll("input[type=submit]").forEach((submit) => {
    submit.addEventListener('click', (event) => {
      event.preventDefault();
      if (document.querySelector(".result-checked") != null) {
        document.forms[0].submit();
      }
      else {
        noProject.classList.remove("hidden");
      }
    })
  })
}
