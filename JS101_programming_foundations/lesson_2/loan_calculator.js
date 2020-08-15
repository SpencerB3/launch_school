const rlSync = require('readline-sync');
const MESSAGES = require('./loan_calculator_messages.json');

const MONTHS_PER_YEAR = 12;

function prompt(message) {
  console.log(`=> ${message}`);
}

function isInvalidNumber(num) {
  return num.trim() === 0 ||
  Number.isNaN(Number(num)) ||
  Number(num) < 0;
}

let retrieveInput = (inputType, isInvalidInput) => {
  prompt(MESSAGES[inputType]);
  let input = rlSync.question();
  while (isInvalidInput(input)) {
    prompt(MESSAGES[`invalid${inputType}`]);
    input = rlSync.question();
  }
  return input;
};

function getLoanLength(loanDuration, isInvalidNumber) {
  let input = retrieveInput(loanDuration, isInvalidNumber);
  while ((Number(input) - Math.floor(Number(input)) !== 0) ||
  Number(input) === 0) {
    prompt(MESSAGES['wholeNumbers']);
    input = retrieveInput(loanDuration, isInvalidNumber);
  }
  return input;
}

function calculatePayment(loan, monthlyInterestRate, loanDurationMonths) {
  return (loan * (monthlyInterestRate /
  (1 - Math.pow((1 + monthlyInterestRate), (-loanDurationMonths)))));
}

function isInvalidAnswer(answer) {
  return (!['y', 'yes', 'n', 'no'].includes(answer.toLowerCase()));
}

// -----------main code-------------

console.clear();
prompt(MESSAGES['welcome']);

while (true) {

  let loan = Number(retrieveInput('loanAmount', isInvalidNumber));
  console.clear();

  let apr = Number(retrieveInput('apr', isInvalidNumber));
  console.clear();

  let loanDurationYear = Number(getLoanLength('loanDuration', isInvalidNumber));
  console.clear();

  let monthlyInterestRate = ((apr / 100) / MONTHS_PER_YEAR);

  let loanDurationMonths = loanDurationYear * MONTHS_PER_YEAR;

  let monthlyPayment = calculatePayment(loan, monthlyInterestRate,
    loanDurationMonths);

  prompt(`Your monthly payment is $${monthlyPayment.toFixed(2)}.`);

  let answer = retrieveInput('answer', isInvalidAnswer).toLowerCase();

  if (answer[0] === 'n' || answer === 'no') break;
}

console.clear();
prompt(MESSAGES['thankYou']);
