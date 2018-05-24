function initMap() {

  var default_location = new google.maps.LatLng(<%= @default_location[:latitude] %>, <%= @default_location[:longitude] %>);
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: default_location
  });

  //convert locations from ruby variable to javascript object
  var markers = []
  <% @markers.each do |m| %>
    var mark = {
      lat: <%= m[:latitude] %>,
      lng: <%= m[:longitude] %>,
      on: <%= m[:light_on] %>,
      title: '<%= m[:tender] %> @ ' + '<%= m[:venue] %>'
    };
    markers.push(mark)
  <% end %>

  //holds custom icons
  var icons = {
    enabled: {
      url: "/images/purple-lamp.png", // url
      scaledSize: new google.maps.Size(50, 50), // scaled size
      origin: new google.maps.Point(0,0), // origin
      anchor: new google.maps.Point(0,0) // anchor
    }, 
    disabled: {
      url: "/images/grey-lamp.png", // url
      scaledSize: new google.maps.Size(50, 50), // scaled size
      origin: new google.maps.Point(0,0), // origin
      anchor: new google.maps.Point(0,0) // anchor
    }
  };
  if (markers.length > 1) {
    //create a google map marker for each 
    for (var i = markers.length - 1; i >= 0; i--) {
      if (markers[i].on === true) {
        icon = icons['enabled']
      } else {
        icon = icons['disabled']
      };
      var markerInfoWindow = new google.maps.InfoWindow()
      geoposition = new google.maps.LatLng(markers[i].lat, markers[i].lng);
      marker = new google.maps.Marker({
        position: geoposition,
        map: map,
        icon: icon,
        title: markers[i].title 
      });

      //show title of location when you click the pin
      marker.addListener('click', function() {
        markerInfoWindow.setContent(this.get('title'));
        markerInfoWindow.open(map, this);
      });
    }
  } else {
    var drinkMore = new google.maps.InfoWindow;
    drinkMore.setContent('No one you follow is working right now.. Maybe you should tip more?')
    drinkMore.setPosition(default_location)
    drinkMore.open(map);
  }

  //show if location is found and pop up (or popup error if no location services)
  infoWindow = new google.maps.InfoWindow;

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      // $.ajax({
      // type: 'GET',
      // url: '/',
      // data: pos,
      // contentType: 'application/json',
      // dataType: 'json'
      // }).done(function(data){
      //    console.log(data)
      // });

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      infoWindow.open(map);
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}