$(document).ready(function () {

  if (! window.DeviceOrientationEvent) {
    return;
  }

  $(window).on('deviceorientation', function (event) {
    $('body').css('letter-spacing', event.originalEvent.gamma);
    $('body').css('line-spacing', event.originalEvent.beta);
  });

});