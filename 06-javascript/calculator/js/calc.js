var getOperator = function () {
  return prompt('Please enter your operator: +, -, *, /, %, √ or Q to quit');
};

// Returns a floating point number.
var getOperands = function () {
  var result = prompt('Please enter operands, separated by commas');
  if (! result) {
    return [];
  };
  var operands = result.split(',');
  for (var i = 0; i < operands.length; i++) {
    operands[i] = parseFloat(operands[i]);
  };
  return operands;
};

var doOperation = function(operator, operands) {
  if (operands.length == 0) return NaN;
  var result = operands[0];
  for (var i = 1; i < operands.length; i++) {
    switch(operator) {
      case '+':
        result += operands[i];
        break;
      case '-':
        result -= operands[i];
        break;
      case '*':
        result = result * operands[i];
        break;
      case '/':
        result = result / operands[i];
        break;
      case '%':
        result = result % operands[i];
        break;
      case '√':
      case 'sqrt':
        result = Math.sqrt(operands[0]);
        break;
    };
  };

  return result;
}

var calculate = function () {
  var operator = getOperator();

  if (operator == 'Q') {
    return 'quit';
  }

  var operands = getOperands();

  var result = doOperation(operator, operands);

  console.log(operator, operands, '=', result);
};

while (calculate() != 'quit') {}; // Sorry about this.

