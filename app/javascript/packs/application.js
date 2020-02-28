import "bootstrap";
import { initSweetalert } from '../plugins/init_sweetalert';
import { priceUpdate } from '../components/priceUpdate';

initSweetalert('#confirm-booking', {
  title: "Your booking is confirmed",
  text: "Have a nice ride",
  icon: "success",
  timer: 3000
}, (value) => {
  console.log(value);
});

priceUpdate();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initAutocomplete();
