import "bootstrap";
import "../components/form";
import "../components/payment-form";
import "../components/result";
import "../components/project-index";
<<<<<<< HEAD
import "../components/title";
=======
import { hideFlashAfter5sec } from '../components/flashes';
hideFlashAfter5sec();
>>>>>>> f4a8a4473e8cdffdb149c4af9be251418bd1cb0b

import { autocomplete } from "../components/autocomplete";
if (document.querySelector(".autocomp")) {
  autocomplete();
};

// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

// import "../components/tabs";
// import "../components/progress-bar";
