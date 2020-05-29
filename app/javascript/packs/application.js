require("@rails/ujs").start()
require("@rails/activestorage").start()
require("turbolinks").start()
require("channels")

import "bootstrap";
import "../plugins/flatpickr"
import { initMapbox } from '../plugins/init_mapbox';
import { initFlatpicker } from '../plugins/flatpickr';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initFlatpicker();

})
