var context;
var FRACTAL_DIMENSION = 0.9;

var drawLine = function(x1, y1, x2, y2) {
  context.moveTo(x1, y1);
  context.lineTo(x2, y2);
  context.stroke();
}

var drawSquare = function(x1, y1, length) {
  var x2 = x1 + length;
  var y2 = y1 + length;

  // Top side
  drawLine(x1, y1, x2, y1);
  // Right side
  drawLine(x2, y1, x2, y2);
  // Bottom side
  drawLine(x2, y2, x1, y2);
  // Left side
  drawLine(x1, y2, x1, y1);
}

var recursiveSquares = function (x1, y1, length) {
  drawSquare(x1, y1, length);
  var newLength = length * FRACTAL_DIMENSION;
  if (length > 1) {
    recursiveSquares(1024 - (length + x1),
                     1024 - (length + y1),
                     newLength);
  }
}

$(document).ready(function redraw() {
  var $canvas = $('canvas');
  context = $canvas.get(0).getContext('2d');
  context.fillStyle = 'dddddd';
  context.fillRect (0, 0, 1024, 1024);
  recursiveSquares(0, 0, 1024);

  //setInterval(redraw, 800);

});