import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Le site de dons aux associations d'utilité publique"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
