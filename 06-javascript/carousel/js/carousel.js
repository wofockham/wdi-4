$(document).ready(function () {

  var $carousel = $('#carousel');
  var $next = $('#next');
  var $previous = $('#previous');

  $carousel.css('left', 0);

  $next.on('click', function () {
    var width = $('img:first').width();
    var currentPos = $carousel.css('left');
    $carousel.animate({
      left: parseInt(currentPos, 10) - parseInt(width, 10)
    });
  });

});
