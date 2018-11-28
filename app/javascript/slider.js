import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';

function startSlide() {
  var input = document.querySelector("input.slider");
  var mySlider = new Slider(input);

  mySlider.on('slideStop', function() {

    document.querySelectorAll('.card-user').forEach((card) => {
       var kmSelector = mySlider.getValue()
       var distance = parseInt(card.querySelector('.card-km').innerHTML.match(/^\d*/)[0], 10)
       console.log(distance)

        if (distance < kmSelector) {
          card.classList.remove('d-none');
          console.log("AFFICHER")
       console.log(distance)
        } else {
          card.classList.add('d-none');
          console.log("REMOVE")
       console.log(distance)
        }
      // addEventListener("click", (event) => {
      //   event.currentTarget.classList.toggle("img-circle");
      // });
    });
  })
}

export { startSlide };
