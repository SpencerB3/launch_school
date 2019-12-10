const messagesJSON = require('calculator_messages.json');
const MESSAGES = JSON.parse(messagesJSON);

const rlSync = require('readline-sync');

const log = (message) => console.log(`=> ${message}`);
let anotherCalc;
let name = rlSync.prompt();

function invalidNumber(number) {
  return number.trimStart() === '' || Number.isNaN(Number(number));
}

function isValidName(name) {
  return name.trimStart() !== '';
}

while (!isValidName(name)) {
  console.log('Hmmm... that does not seem like you typed anything.  Try again.');
  name = rlSync.prompt();
}

log(MESSAGES['welcome']);
log(MESSAGES['name']);

log(`Hi, ${name}!`);

do {
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

log('Would you like to do another calculation?')
log("Enter 'y' if yes, else enter any other key to exit this program")

anotherCalc = rlSync.prompt().toLowerCase();
console.clear();

} while (anotherCalc === 'y');

log('Thank you for using Calculator!');
