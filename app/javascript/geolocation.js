// function getUserLocation() {
//   navigator.geolocation.getCurrentPosition(function(location) {
//     const lat = location.coords.latitude;
//     const lng = location.coords.longitude;
//     const coordinates = { lat: lat, lng: lng };
//     console.log(coordinates)
//     // return coordinates
//   });
// }


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


function getFriendLocation(cardUser) {
  const datas = cardUser.dataset
  const lat = datas.lat;
  const lng = datas.lng;
  return { lat: lat, lng: lng };
};




function getFriendsProximity() {
  var getCurrentGPS = new Promise(function(resolve, reject) {
    navigator.geolocation.getCurrentPosition(function(location) {
      const lat = location.coords.latitude;
      const lng = location.coords.longitude;
      const coordinates = { lat: lat, lng: lng };
      resolve(coordinates)
    });
  });

  getCurrentGPS.then(function(userLocation){

    const cardUsers = document.querySelectorAll(".card-index");
    cardUsers.forEach((cardUser) => {
      const friendLocation = getFriendLocation(cardUser);
      const distance = distanceBetween(userLocation["lat"], userLocation["lng"], friendLocation["lat"], friendLocation["lng"]);
      console.log(distance);
      const cardUserLocation = cardUser.querySelector(".distance").innerHTML = `${Math.round(distance * 100) / 100} Km` ;
      console.log(cardUser);

    });

  });
}

export { getFriendsProximity };
