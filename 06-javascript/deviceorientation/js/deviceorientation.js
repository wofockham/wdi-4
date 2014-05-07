$(document).ready(function () {

  if (! window.DeviceOrientationEvent) {
    return;
  }

  $(window).on('deviceorientation', function (event) {
    console.log(event.originalEvent.gamma);
    if (event.originalEvent.gamma > 1) {
      $('body').addClass('flippedY');
    } else {
      $('body').removeClass('flippedY');
    }

    if (event.originalEvent.beta > 1) {
      $('body').addClass('flippedX');
    } else {
      $('body').removeClass('flippedX');
    }
  });

});