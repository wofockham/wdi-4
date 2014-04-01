/*
Given the following a rectangle object like the one below, write the following functions:

isSquare - Returns whether the rectangle is a square or not
area - Calculates the area of the rectangle
perimeter - Calculates the perimeter of the rectangle
*/

var rectangleFactory = function (length, width) {
  return {
    length: length,
    width: width,
    isSquare: function () {
      return this.length === this.width;
    },
    area: function () {
      return this.length * this.width;
    },
    perimeter: function () {
     return 2 * (this.length + this.width);
    }
  };
};

var rectangle = rectangleFactory(4, 6);
var square = rectangleFactory(5, 5);

console.log(rectangle.isSquare());
console.log(rectangle.area());
console.log(rectangle.perimeter());
