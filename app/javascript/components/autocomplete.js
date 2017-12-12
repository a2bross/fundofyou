function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var autoAddress = document.querySelector('.autocomp');

    if (autoAddress) {
      var autocomplete = new google.maps.places.Autocomplete(autoAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(autoAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
