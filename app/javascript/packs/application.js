import "bootstrap";
import { initSweetalert } from '../plugins/init_sweetalert';
initSweetalert('#confirm-booking', {
  title: "Your booking is confirmed",
  text: "Have a nice ride",
  icon: "success"
}, (value) => {
  console.log(value);
});
