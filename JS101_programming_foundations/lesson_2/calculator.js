const MESSAGES = require('./calculator_messages.json');

const rlSync = require('readline-sync');

function prompt(message) {
  console.log(`=> ${message}`);
}

function chooseLanguage() {
  prompt(MESSAGES['language']);
  let language = rlSync.question().toLowerCase();

  while (!validateLanguage(language)) {
    prompt(MESSAGES["invalidLanguage"]);
    language = rlSync.question().toLowerCase();
  }
  return language;
}

function getFirstNumber() {
  prompt(MESSAGES[language]['firstNumber']);  
  let number1 = rlSync.question();

  while (invalidNumber(number1)) {
    prompt(MESSAGES[language]['invalidNumber']);
    number1 = rlSync.question();
  }
  return number1;
}

function getSecondNumber() {
  prompt(MESSAGES[language]['secondNumber']);
  let number2 = rlSync.question();

  while (invalidNumber(number2)) {
    prompt(MESSAGES[language]['invalidNumber']);
    number2 = rlSync.question();
  }
  return number2;
}

function invalidNumber(number) {
  return number.trimStart() === '' || Number.isNaN(Number(number));
}

function validateLanguage(language) {
  switch (language) {
    case 'en': return true;
    case 'es': return true;
    default: return false;
  }
}

function calculations(operation, number1, number2) {
  switch (operation) {
    case 1: return Number(number1) + Number(number2);
    case 2: return Number(number1) - Number(number2);
    case 3: return Number(number1) * Number(number2);
    case 4: return Number(number1) / Number(number2);
  }
}

function chooseOperation(language, number2) {
  prompt(MESSAGES[language]['operations']);
  let operation = Number(rlSync.question());

  while (![1, 2, 3, 4].includes(operation)) {
    prompt(MESSAGES[language]['invalidOperations']);
    operation = Number(rlSync.question());
  }
  while (operation === 4 && number2 === '0') {
    prompt(MESSAGES[language]['invalidDivision']);
    operation = Number(rlSync.question());
  }
  return operation;
}

function convertOperation(operation) {
  switch (operation) {
    case 1: return '+';
    case 2: return '-';
    case 3: return 'x';
    case 4: return '/';
  }
}

let answer;

// initial code
console.clear();

let language = chooseLanguage();

console.clear();

// main code
prompt(MESSAGES[language]['welcome']);

do {

  let number1 = getFirstNumber()
  console.clear();

  let number2 = getSecondNumber();
  console.clear();

  let operation = chooseOperation(language, number2);

  console.clear();

  let output = calculations(operation, number1, number2);

  prompt(`${number1} ${convertOperation(operation)} ${number2} = ${output}`);

  answer = rlSync.question(prompt(MESSAGES[language]["anotherCalculation"]));

} while (answer === 'y' || answer === 'yes');

console.clear();
prompt(MESSAGES['thankYou']);
