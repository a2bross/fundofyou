import "bootstrap";
import "../components/form";
import "../components/payment-form";

import { autocomplete } from '../components/autocomplete';
autocomplete();

// import { loadDynamicBannerText } from '../components/banner';
// loadDynamicBannerText();

// import "../components/tabs";
// import "../components/progress-bar";

import { checked, updatePrices, updateAmount } from "../components/result";
updateAmount();
checked();
updatePrices();
