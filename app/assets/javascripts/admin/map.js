$(document).ready(function(){
  var lat = 21.0167326
  var long = 105.78417680000007
  lat = $('#restaurant-lat').val() == '' ? lat : parseFloat($('#restaurant-lat').val())
  long = $('#restaurant-long').val() == '' ? long : parseFloat($('#restaurant-long').val())
  $('#restaurant-map').locationpicker({
    location: {latitude: lat, longitude: long},
    inputBinding: {
      latitudeInput: $('#restaurant-lat'),
      longitudeInput: $('#restaurant-long'),
      locationNameInput: $('#restaurant-address')
    },
    enableAutocomplete: true
  });
});
