if (document.getElementById("causes-selected")) {
  $(document).ready(function(){
    $(".cause-choice").click(function(){
      $(this).toggleClass("active");
      document.getElementById('no-bullet').classList.add("hidden");
      const bullet = document.getElementById(`bullet-${this.htmlFor}`);
      bullet.classList.toggle("hidden");
    });

    $(".scope-choice").click(function(){
      document.getElementById("bullet-local").classList.add("hidden");
      document.getElementById("bullet-abroad").classList.add("hidden");
      document.getElementById("bullet-no-scope").classList.add("hidden");
      const bullet = document.getElementById(`bullet-${this.htmlFor}`);
      bullet.classList.toggle("hidden");
    });

    document.querySelector("input[type=reset]").addEventListener('click', (event) => {
      const bullets = document.querySelectorAll(".bullet");
      bullets.forEach((bullet) => { bullet.classList.add("hidden")});
      const causes = document.querySelectorAll(".cause-choice");
      causes.forEach((cause) => { cause.classList.remove("active")});
    });

    document.querySelector("input[type=submit]").addEventListener('click', (event) => {
      event.preventDefault();
      if (document.querySelector(".active") != null) {
        document.forms[0].submit();
      }
      else {
        document.getElementById('no-bullet').classList.remove("hidden");
      }
    })

    const submitButtonTop = document.getElementById('criteria-submit');
    submitButtonTop.addEventListener("click", (event) => {
      event.preventDefault();
      document.querySelector("input[type=submit]").click();
    });

    const resetButton = document.getElementById('criteria-reset');
    resetButton.addEventListener("click", (event) => {
      event.preventDefault();
      document.querySelector("input[type=reset]").click();
    })

  });
}

