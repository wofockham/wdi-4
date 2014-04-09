$(document).ready(function () {

  var $body = $('body');

  var parallax = function (event) {
    var scroll = $(window).scrollTop();
    var bgPos = scroll * 0.2;
    $body.css({
      'background-position-y': -bgPos
    })
  };

  $(window).on('scroll', parallax);


  var $nav = $('nav');
  var hiddenLeft = -($nav.width() + 16)

  // Hide the nav initially.
  $nav.css({
    left: hiddenLeft
  })

  $nav.hover(function () {
    $nav.stop().animate({
      left: 0
    }, 400);
  }, function () {
    $nav.stop().animate({
      left: hiddenLeft
    }, 400);
  });

  var colours = [
    'white',
    '#bbb',
    '#888',
    '#444'
  ];

  colours.sample = function () {
    var n = Math.round(Math.random() * this.length);
    return this[n];
  };

  var c = function (e) {
    var n = Math.round((e.clientX / $(window).width()) * 255);
    return "rgb(" + [n, 0, n].join(',') + ")";
  };

  $(window).on('mousemove', function (event) {
    var size = (4 * Math.random()) + 'em';
    var $bubble = $('<div class="bubble" />').css({
      top: event.clientY,
      left: event.clientX,
      width: size,
      height: size,
      'border-color': colours.sample()
    }).appendTo('body');
    $bubble.animate({
      top: -256
    }, 3000, function () {
      $bubble.remove();
    });
  });

});
