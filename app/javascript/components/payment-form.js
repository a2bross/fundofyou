const subscription = document.querySelectorAll(".subscription-choice")
if (subscription[0]) {
  $(document).ready(function(){
    $(".subscription-choice").click(function(){
      subscription.forEach((div) => { div.classList.remove("active")});
      $(this).toggleClass("active");
    })
  });
  const inputPrice = document.getElementById("order_amount");
  inputPrice.addEventListener("change", (event) => {
    if (!inputPrice.NaN) {
      document.getElementById('formAmount').submit();
    }
  });
}
