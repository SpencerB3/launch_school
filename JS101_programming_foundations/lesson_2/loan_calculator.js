const rlSync = require('readline-sync');
const MESSAGES = require('./loan_calculator_messages.json');

const MONTHS_PER_YEAR = 12;

function prompt(message) {
  console.log(`=> ${message}`);
}

function isInvalidNumber(num) {
  return num.trim() === 0 ||
    Number.isNaN(Number(num)) ||
    Number(num) <= 0;
}

function isNotWholeNumber(num) {
  if (Number(num) - Math.floor(Number(num)) !== 0) {
    return true;
  } else {
    return false;
  }
}

function getLoanAmount() {
  prompt(MESSAGES['loanAmount']);
  let loan = rlSync.question();

  while (isInvalidNumber(loan)) {
    prompt(MESSAGES['invalidNum']);
    loan = rlSync.question();
  }
  return Number(loan);
}

function getAnnualInterestRate() {
  prompt(MESSAGES['getAPR']);
  let annualInterestRate = rlSync.question();

  while (isInvalidNumber(annualInterestRate)) {
    prompt(MESSAGES['invalidAPR']);
    annualInterestRate = rlSync.question();
  }
  return Number(annualInterestRate);
}

function getLoanDurationYears() {
  prompt(MESSAGES['loanDuration']);
  let loanDurationYears = rlSync.question();

  while (isInvalidNumber(loanDurationYears) ||
    isNotWholeNumber(loanDurationYears)) {
    prompt(MESSAGES['invalidLoanDuration']);
    loanDurationYears = rlSync.question();
  }
  return Number(loanDurationYears);
}

function calculatePayment(loan, monthlyInterestRate, loanDurationMonths) {
  return (loan * (monthlyInterestRate /
    (1 - Math.pow((1 + monthlyInterestRate), (-loanDurationMonths)))));
}

function getAnotherCalculation() {
  prompt(MESSAGES['anotherCalculation']);
  let answer = rlSync.question().toLowerCase();

  while (!['y', 'yes', 'n', 'no'].includes(answer)) {
    prompt(MESSAGES['invalidAnswer']);
    answer = rlSync.question();
  }
  return answer;
}

// -----------main code-------------

console.clear();
prompt(MESSAGES['welcome']);

while (true) {

  let loan = getLoanAmount();
  console.clear();

  let annualInterestRate = getAnnualInterestRate();
  console.clear();

  let loanDurationYears = getLoanDurationYears();
  console.clear();

  let monthlyInterestRate = ((annualInterestRate / 100) / MONTHS_PER_YEAR);

  let loanDurationMonths = loanDurationYears * MONTHS_PER_YEAR;

  let monthlyPayment = calculatePayment(loan, monthlyInterestRate,
    loanDurationMonths);

  prompt(`Your monthly payment is $${monthlyPayment.toFixed(2)}.`);

  let answer = getAnotherCalculation();

  if (answer[0] === 'n' || answer === 'no') break;
}

console.clear();
prompt(MESSAGES['thankYou']);
