const rlSync = require('readline-sync');
const prompt = (message) => console.log(`==> ${message}`);

function isInvalidNumber(number) {
  return number.trim() === '' ||
         Number(number) < 0   ||
         Number.isNaN(Number(number));
}

prompt('Welcome to Loan Calculator');

while (true) {
  prompt('-------------------------------');

  prompt("Please enter your loan amount");
  let loanAmount = rlSync.question();

  while (isInvalidNumber(loanAmount)) {
    prompt("That doesn't look like a valid positive number.  Try again");
    loanAmount = rlSync.question();
  }

  prompt("Please enter your annual interest \n Enter 5 for 5%, 10 for 10%");
  let annualInterest = rlSync.question();

  while (isInvalidNumber(annualInterest)) {
    prompt("That doesn't look like a valid positive number.  Try again");
    annualInterest = rlSync.question();
  }

  prompt("Please enter your loan duration in months");
  let loanDuration = rlSync.question();

  while (isInvalidNumber(loanDuration)) {
    prompt("That doesn't look like a valid positive number.  Try again");
    loanDuration = rlSync.question();
  }

  let monthlyInterest = Number(annualInterest / 12) / 100;

  let payment = Number(loanAmount) * (monthlyInterest / 
                (1 - Math.pow((1 + monthlyInterest), (Number(-loanDuration)))));

  prompt(`Your monthly payment will be $${payment.toFixed(2)}.`)

  prompt("Another calculation? Type y for yes, n for no");
  let answer = rlSync.question().toLowerCase();

  while (answer[0] !== 'y' && answer[0] !== 'n') {
    prompt("That doesnt look like a valid answer.  Please enter 'y' or 'n'.");
    answer = rlSync.question().toLowerCase();
  }
  if (answer[0] === 'n') break;
}

prompt("Thank you for using Loan Calculator!")
