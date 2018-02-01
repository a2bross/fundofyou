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


    const allItemForm = document.getElementById("add-item-form");
    const addItem = document.querySelector(".add-item");
    const itemHTML = '<div class="form-column"><div class="item-name-column"><input type="text" name="project[items][][name]" id="project_items__name" value="" placeholder="Nom de l&#39;objet" class="form-control" maxlength="50" /><p class="help-block">50 caractères.</p></div><input type="text" name="project[items][][budget]" id="project_items__budget" value="" placeholder="Montant de l&#39;objet" class="form-control" />';
    addItem.addEventListener("click", e => {
      e.preventDefault();
      allItemForm.insertAdjacentHTML('beforeend', itemHTML);
   })
  })
};
