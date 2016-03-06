var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 51.5072, lng: 0.1275},
    zoom: 9
  });
}

function createMarkerWithInfo(obj) {
	var latLng = {lat: obj.lat, lng: obj.lng};

	var contentString = '<div id="content">'+
  '<div id="bodyContent">'+
  '<p>Address: '+ obj.address + '</p>' +
  '<p>Address: '+ obj.address + '</p>' +
  '<p>Address: '+ obj.address + '</p>' +
  '<p>Phone Number: '+ obj.phone + '</p>' +
  '</div>'+
  '</div>';

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker = new google.maps.Marker({
    position: latLng,
    map: map,
    title: obj.name
  });
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}

document.getElementById('submitPostcode').addEventListener('click', function(x) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
    	var markerArray = JSON.parse(xhr.responseText);
    	markerArray.forEach(function(x) {
	    	createMarkerWithInfo(x);
	    });
		}
	};
	var postCode = document.getElementById('postCodeInput').value;
	var page = document.getElementById('GP') ? 'GP' : 'SG';
	xhr.open('GET', page+'&postCode='+postCode);
	xhr.send();
});