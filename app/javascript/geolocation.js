function distanceBetween(lat1, lon1, lat2, lon2) {
  var R = 6371; // km
  var dLat = toRad(lat2-lat1);
  var dLon = toRad(lon2-lon1);
  var lat1 = toRad(lat1);
  var lat2 = toRad(lat2);

  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  var d = R * c;
  return d;
};

// Converts numeric degrees to radians
function toRad(Value) {
  return Value * Math.PI / 180;
};

function getLocation(card) {
  const datas = card.dataset
  const lat = datas.lat;
  const lng = datas.lng;
  return { lat: lat, lng: lng };
};

function getProximity() {
  var getCurrentGPS = new Promise(function(resolve, reject) {
    navigator.geolocation.getCurrentPosition(function(location) {
      const lat = location.coords.latitude;
      const lng = location.coords.longitude;
      const coordinates = { lat: lat, lng: lng };
      resolve(coordinates)
    });
  });

  getCurrentGPS.then(function(userLocation){
    const cards = document.querySelectorAll(".card-user, .card-event");
    document.getElementById("user_latitude").value = userLocation['lat'];
    document.getElementById("user_longitude").value = userLocation['lng'];
    document.querySelector(".toto").submit();

    cards.forEach((card) => {
      const location = getLocation(card);
      const distance = distanceBetween(userLocation["lat"], userLocation["lng"], location["lat"], location["lng"]);
      console.log(userLocation["lng"]);
      const cardLocation = card.querySelector(".card-km").innerHTML = `${Math.round(distance * 100) / 100} Km` ;
    });
  });
}


// Converts numeric degrees to radians
export { getProximity };
