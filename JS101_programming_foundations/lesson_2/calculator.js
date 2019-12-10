// Ask the user for the first number.
// Ask the user for the second number.
// Ask the user for an operation to perform.
// Perform the operation on the two numbers.
// Print the result to the terminal.

const rlSync = require('readline-sync');

const log = (message) => console.log(`=> ${message}`);

function invalidNumber(number) {
  return number.trimStart() === '' || Number.isNaN(Number(number));
}

log('Welcome to Calculator!');

log('Enter your first number:');
let number1 = rlSync.question();

while (invalidNumber(number1)) {
  log('Hmmm... that does not look like a valid number. Try again');
  number1 = rlSync.question();
}

log('Enter your second number:');
let number2 = rlSync.question();

while (invalidNumber(number2)) {
  log('Hmmm... that does not look like a valid number. Try again');
  number2 = rlSync.question();
}

log("What operation would you like to perform?\n" +
           "1) Add 2) Subtract 3) Multiply 4) Divide");
let operation = rlSync.question();

while (!['1', '2', '3', '4'].includes(operation)) {
  log('Hmmm... that does not look like a valid option.  Try again');
  operation = rlSync.question();
}

let output;

switch (operation) {
  case '1':
    output = Number(number1) + Number(number2);
    break;
  case '2':
    output = Number(number1) - Number(number2);
    break;
  case '3':
    output = Number(number1) * Number(number2);
    break;
  case '4':
    output = Number(number1) / Number(number2);
    break;
}

log(`The result is ${output}.`);
