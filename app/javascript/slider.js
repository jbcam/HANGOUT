
import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';

var mySlider;

function startSlide() {

  var ex1 = document.getElementById("ex1");
  // var input = document.querySelector("input.slider");
  if (ex1) {
    mySlider = new Slider("#ex1", {
      tooltip: 'always',
      tooltip_position: 'bottom'
    });

    mySlider.on('slideStop', filterDistance);
  }

}

function filterDistance(e) {
  document.querySelectorAll('.card-user').forEach((card) => {
    var kmSelector = mySlider.getValue()
    var distance = parseInt(card.querySelector('.card-km').innerHTML.match(/[0-9\.]+/)[0], 10)
    if (distance < kmSelector) {
      card.classList.remove('d-none');
    } else {
      card.classList.add('d-none');
    }
  });

  document.querySelectorAll('.card-event').forEach((card) => {
    var kmSelector = mySlider.getValue()
    var distance = parseInt(card.querySelector('.card-km').innerHTML.match(/^\d*/)[0], 10)


    if (distance < kmSelector) {
      card.classList.remove('d-none');
    } else {
      card.classList.add('d-none');
    }
  });
};



export { startSlide, filterDistance };

