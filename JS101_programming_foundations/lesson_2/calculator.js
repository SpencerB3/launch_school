const MESSAGES = require('./calculator_messages.json');

const rlSync = require('readline-sync');

function prompt(message) {
  console.log(`=> ${message}`);
}

function invalidNumber(number) {
  return Number.isNaN(number);
}
let answer;

// main code
prompt('Welcome to Calculator!');

do {
  let number1 = Number(rlSync.question("=> What's your first number?\n"));

  while (invalidNumber(number1)) {
    prompt("Hmm, that doesn't look like a valid number.  Try again");
    number1 = rlSync.question();
  }

  let number2 = Number(rlSync.question("=> What's your second number?\n"));

  while (invalidNumber(number2)) {
    prompt("Hmm, that doesn't look like a valid number.  Try again");
    number2 = rlSync.question();
  }

  prompt("What operation would you like to perform?\n1) Add 2) Subtract 3) Multiply 4) Divide")
  let operation = Number(rlSync.question());

  while (![1, 2, 3, 4].includes(operation)) {
    prompt('Must choose 1, 2, 3, or 4');
    operation = rlSync.questionFloat();
  }

  let output;
  switch (operation) {
    case 1:
      output = number1 + number2;
      break;
    case 2:
      output = number1 - number2;
      break;
    case 3:
      output = number1 * number2;
      break;
    case 4:
      output = number1 / number2;
  }

  prompt(`The result is ${output}.`);

  prompt("Would you like to do another calculation? Type y or n")
  answer = rlSync.question().toLowerCase;

} while (answer === 'y');

prompt('Thank you for using Calculator!  Good bye!');
