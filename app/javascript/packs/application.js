import "bootstrap";
import "../components/form";
import "../components/payment-form";
import "../components/result-card";

import { autocomplete } from '../components/autocomplete';
autocomplete();

// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

// import "../components/tabs";
// import "../components/progress-bar";


// load the following only for the result page
import { checked, updatePrices, updateAmount } from "../components/result";
if (document.getElementById("result-page")) {
  updateAmount();
  checked();
  updatePrices();
};
