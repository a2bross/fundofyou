if (document.getElementById("first-step")) {
  $(document).ready(function(){
    $(".cause-choice").click(function(){
      $(this).toggleClass("active");
    })

    const breadcrumbs = document.querySelectorAll(".criteria-breadcrumb-item");
    const firstStep = document.getElementById("first-step");
    const backFirstStep = document.getElementById("back-first-step");
    const toSecondStep = document.getElementById("to-second-step");
    const secondStep = document.getElementById("second-step");
    const backSecondStep = document.getElementById("back-second-step");
    const toThirdStep = document.getElementById("to-third-step");
    const thirdStep = document.getElementById("third-step")
    toSecondStep.addEventListener("click", event => {
      event.preventDefault();
      breadcrumbs[1].classList.add("criteria-breadcrumb-item-active");
      firstStep.classList.add("hidden");
      secondStep.classList.remove("hidden");
    })

    backFirstStep.addEventListener("click", event => {
      event.preventDefault();
      breadcrumbs[1].classList.remove("criteria-breadcrumb-item-active");
      firstStep.classList.remove("hidden");
      secondStep.classList.add("hidden");
    })

    toThirdStep.addEventListener("click", event => {
      event.preventDefault();
      breadcrumbs[2].classList.add("criteria-breadcrumb-item-active");
      secondStep.classList.add("hidden");
      thirdStep.classList.remove("hidden");
    })

    backSecondStep.addEventListener("click", event => {
      event.preventDefault();
      breadcrumbs[2].classList.remove("criteria-breadcrumb-item-active");
      secondStep.classList.remove("hidden");
      thirdStep.classList.add("hidden");
    })

  })
};
