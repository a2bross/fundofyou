const indexCards = document.querySelectorAll(".index-card");
const projectFocus = document.querySelectorAll(".fixed-background");
if (indexCards[0]) {
  indexCards[0].classList.add("card-focus");
  projectFocus[0].classList.remove("hidden");
  indexCards.forEach((card) => {
    card.addEventListener("click", (event) => {
      indexCards.forEach((card) => { card.classList.remove("card-focus") });
      event.currentTarget.classList.add("card-focus");
      projectFocus.forEach((focus) => { focus.classList.add("hidden") });
      const id = document.querySelector(".card-focus input").value;
      document.getElementById(id).classList.remove("hidden");
    });
  });
}
