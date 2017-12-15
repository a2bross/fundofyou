import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

// load the follwoing only if there are map divs in the page:
if (document.getElementById("map")) {

  // add event listener on appropriate tab click
  document.getElementById("total_projets").addEventListener("click", (event) => {
    setTimeout(function() {
      const mapElement = document.getElementById('map');
      if (mapElement) { // don't try to build a map if there's no div#map to inject in
        const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
        const markers = JSON.parse(mapElement.dataset.markers);
        map.addMarkers(markers);
        if (markers.length === 0) {
          // set the default to Paris coordinates
          map.setCenter(48.8566, 2.3522)
          map.setZoom(8);
        } else if (markers.length === 1) {
          map.setCenter(markers[0].lat, markers[0].lng);
          map.setZoom(14);
        } else {
          map.fitLatLngBounds(markers);
        }
      }
    }, 300)
  });
}

autocomplete();
