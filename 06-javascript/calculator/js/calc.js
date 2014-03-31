var getOperator = function () {
  return prompt('Please enter your operator: +, -, *, /, %, √ or Q to quit');
};

// Returns a floating point number.
var getOperand = function () {
  var result = prompt('Please enter an operand');
  result = parseFloat(result);
  return result;
};


var calculate = function () {
  var operator = getOperator();

  if (operator == 'Q') {
    return 'quit';
  }

  var operandA = getOperand();
  var operandB = getOperand();

  console.log(operator, operandA, operandB);

  var result;

  if (operator == '+') {
    result = operandA + operandB;
  } else if (operator == '-') {
    result = operandA - operandB;
  } else if (operator == '*') {
    result = operandA * operandB;
  } else if (operator == '/') {
    result = operandA / operandB;
  } else if (operator == '%') {
    result = operandA % operandB;
  } else if (operator == '√') {
    result = Math.sqrt(operandA);
  }

  console.log(operandA, operator, operandB, '=', result);
  alert(result);
};

while (calculate() != 'quit') {}; // Sorry about this.

