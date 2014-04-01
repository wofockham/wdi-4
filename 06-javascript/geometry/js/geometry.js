/*
Given the following a rectangle object like the one below, write the following functions:

isSquare - Returns whether the rectangle is a square or not
area - Calculates the area of the rectangle
perimeter - Calculates the perimeter of the rectangle
*/

var Rectangle = function (length, width) {
  this.length = length;
  this.width = width;
  // Add a method by adding a new key to `this`.
  this.isSquare = function () {
    return this.length === this.width;
  };
};

// Adding methods by "extending" the Rectangle prototype.
Rectangle.prototype.area = function () {
  return this.length * this.width;
};

Rectangle.prototype.perimeter = function () {
 return 2 * (this.length + this.width);
};

var rectangle = new Rectangle(4, 6);
var square = new Rectangle(5, 5);

console.log(rectangle.isSquare());
console.log(rectangle.area());
console.log(rectangle.perimeter());
