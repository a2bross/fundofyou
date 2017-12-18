if (document.getElementById("causes-selected")) {
  $(document).ready(function(){
    $(".cause-choice").click(function(){
      $(this).toggleClass("active");
      const noBullet = document.getElementById('no-bullet');
      if (noBullet) {
        noBullet.classList.add("hidden");
      }
      const bullet = document.getElementById(`bullet-${this.htmlFor}`);
      bullet.classList.toggle("hidden");
      const consigne = document.querySelector(".causes-resume em");
      consigne.classList.add("hidden");
      if (!document.querySelector("#causes-selected span:not(.hidden)")) {
        consigne.classList.remove("hidden");
      };
    });

    // $(".scope-choice").click(function(){
    //   document.getElementById("bullet-local").classList.add("hidden");
    //   document.getElementById("bullet-abroad").classList.add("hidden");
    //   document.getElementById("bullet-no-scope").classList.add("hidden");
    //   const bullet = document.getElementById(`bullet-${this.htmlFor}`);
    //   bullet.classList.toggle("hidden");
    // });

    // document.querySelector("input[type=reset]").addEventListener('click', (event) => {
    //   const bullets = document.querySelectorAll(".bullet");
    //   bullets.forEach((bullet) => { bullet.classList.add("hidden")});
    //   const causes = document.querySelectorAll(".cause-choice");

    //   causes.forEach((cause) => { cause.classList.remove("active")});

    //   document.querySelector(".causes-resume em").classList.remove("hidden");
    // });

    document.querySelector("input[type=submit]").addEventListener('click', (event) => {
      console.log("coucou")
      event.preventDefault();
      if (document.querySelector(".active") != null) {
        document.forms[0].submit();
      }
      else {
        document.getElementById('no-bullet').classList.remove("hidden");
        document.getElementById('no-bullet-mobile').classList.remove("hidden");
      }
    })

  });
}
