import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["l'écologie", "l'humanitaire", "l'action sociale", "le patrimoine", "l'éducation", "la recherche"],
    typeSpeed: 90,
    loop: true
  });
}

export { loadDynamicBannerText };
