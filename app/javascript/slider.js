import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';

function startSlide() {
  var input = document.querySelector("input.slider");
  var mySlider = new Slider("#ex1", {
    tooltip: 'always',
    tooltip_position: 'bottom'
  });

  mySlider.on('slideStop', function() {

    document.querySelectorAll('.card-user').forEach((card) => {
      var kmSelector = mySlider.getValue()
      var distance = parseInt(card.querySelector('.card-km').innerHTML.match(/^\d*/)[0], 10)

      if (distance < kmSelector) {
        card.classList.remove('d-none');
      } else {
        card.classList.add('d-none');
      }
    });

    document.querySelectorAll('.card-event').forEach((card) => {
      var kmSelector = mySlider.getValue()
      var distance = parseInt(card.querySelector('.card-km').innerHTML.match(/^\d*/)[0], 10)
      console.log(distance)

      if (distance < kmSelector) {
        card.classList.remove('d-none');
      } else {
        card.classList.add('d-none');
      }
    });
  })
}


export { startSlide };
