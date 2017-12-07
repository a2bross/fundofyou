import Typed from 'typed.js';



if (document.querySelector('#banner-typed-text')) {
function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Le site de dons aux associations d'utilité publique"],
    typeSpeed: 50,
    loop: true
  });
};
}

export { loadDynamicBannerText };
