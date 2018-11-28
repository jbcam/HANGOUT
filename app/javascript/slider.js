var rangeSlider = function(){
  var slider = document.querySelectorAll('.range-slider'),
      range = document.querySelectorAll('.range-slider__range'),
      value = document.querySelectorAll('.range-slider__value');

  slider.each(function(){

    value.each(function(){
      var value = this.prev().attr('value');
      this.html(value);
    });

    range.on('input', function(){
      this.next(value).html(this.value);
    });
  });
};

rangeSlider();
