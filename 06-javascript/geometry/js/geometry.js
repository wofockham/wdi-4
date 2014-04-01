/*
Given the following a rectangle object like the one below, write the following functions:

isSquare - Returns whether the rectangle is a square or not
area - Calculates the area of the rectangle
perimeter - Calculates the perimeter of the rectangle
*/

var rectangle = {
  length: 4,
  width: 4,
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

console.log(rectangle.isSquare());
console.log(rectangle.area());
console.log(rectangle.perimeter());