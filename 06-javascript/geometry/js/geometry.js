/*
Given the following a rectangle object like the one below, write the following functions:

isSquare - Returns whether the rectangle is a square or not
area - Calculates the area of the rectangle
perimeter - Calculates the perimeter of the rectangle
*/

var rectangle = {
  length: 4,
  width: 4
};

var isSquare = function (shape) {
  return shape.length === shape.width;
};

var area = function (shape) {
  return shape.length * shape.width;
};

var perimeter = function (shape) {
  return 2 * (shape.length + shape.width);
}
