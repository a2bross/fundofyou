$(document).ready(function(){
  $(".cause-choice").click(function(){
    $(this).toggleClass("active");
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
  const submitButton = document.getElementById('criteria-submit');
  submit.addEventListener("click", (event) => {
    event.preventDefault();
    document.forms[0].submit;
  })
});
