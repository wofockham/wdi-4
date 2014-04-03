console.log('any of this code runs');

$(document).ready(function () {

  var local = "something local";

  var local_array = ['groucho', 'harpo'];

  var marxist = function (members) { // Pass by value for an array.
    var brothers = members.slice(0);
    brothers.push('harpo');
    console.log('inside marxist', brothers);
  };

  marxist(local_array);





  console.log('outside marxist', local_array);

  function christmas(yuletide) { // Pass by value for a string.
    yuletide += '!!!'; // Doesn't update the original value.
    local += '????'; // DOES update the external original value.
    console.log("inside christmas", yuletide);
  };

  christmas( local );
  christmas( local );

  console.log('outside christmas', local);

});
