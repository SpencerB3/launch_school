const MESSAGES = require('./calculator_messages.json');
const rlSync = require('readline-sync');
let language;

function prompt(message) {
  console.log(`=> ${message}`);
}

function chooseLanguage() {
  prompt(MESSAGES['language']);
  let language = rlSync.question().toLowerCase();

  while (!isValidLanguage(language)) {
    prompt(MESSAGES['invalidLanguage']);
    language = rlSync.question().toLowerCase();
  }
  return language;
}

function isValidLanguage(lang) {
  switch (lang) {
    case 'en': return true;
    case 'es': return true;
    default: return false;
  }
}

function getNum(num) {
  prompt(MESSAGES[language][num]);
  let number = rlSync.question();

  while (isInvalidNumber(number)) {
    prompt(MESSAGES[language]['invalidNum']);
    number = rlSync.question();
  }
  return number;
}

function isInvalidNumber(num) {
  return num.trimStart() === 0 || Number.isNaN(Number(num));
}

function getOperation() {
  prompt(MESSAGES[language]['operation']);
  let operation = rlSync.question();

  while (!['1', '2', '3', '4'].includes(operation)) {
    prompt(MESSAGES[language]['invalidOperation']);
    operation = rlSync.question();
  }
  return operation;
}

function divisionError(operation) {
  while (!['1', '2', '3'].includes(operation)) {
    prompt(MESSAGES[language]['invalidDivision']);
    operation = rlSync.question();
  }
  return operation;
}

function getOutput(number1, number2, operation) {
  switch (operation) {
    case ('1'): return Number(number1) + Number(number2);
    case ('2'): return Number(number1) - Number(number2);
    case ('3'): return Number(number1) * Number(number2);
    case ('4'): return Math.floor(Number(number1) / Number(number2));
  }
  return undefined;
}

function validateAnswer() {
  prompt(MESSAGES[language]['anotherOperation']);
  let answer = rlSync.question().toLowerCase();

  while (!['y', 'yes', 'n', 'no'].includes(answer)) {
    prompt(MESSAGES[language]['invalidAnswer']);
    answer = rlSync.question();
  }
  return answer;
}
// ------------- main body

console.clear();

language = chooseLanguage();

console.clear();

prompt(MESSAGES[language]['welcome']);

while (true) {

  let number1 = getNum('firstNum');
  console.clear();

  let number2 = getNum('secondNum');
  console.clear();

  let operation = getOperation();

  if (number2 === '0' && operation === '4') {
    operation = divisionError(operation);
  }

  let output = getOutput(number1, number2, operation);

  prompt(`${MESSAGES[language]['output']} ${output}.`);

  let answer = validateAnswer();
  if (answer === 'n' || answer === 'no') break;
}

prompt(MESSAGES['thankYou']);