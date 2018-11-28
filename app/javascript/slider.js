import Slider from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider';

function startSlide() {
  var input = document.querySelector("input.slider");
  var mySlider = new Slider(input);

  mySlider.on('slideStop', function() {
    console.log(mySlider.getValue())
  })
}

export { startSlide };
