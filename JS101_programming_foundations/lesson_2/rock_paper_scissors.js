const rlSync = require('readline-sync');
const VALID_CHOICES = {
  r: 'rock', p: 'paper', s: 'scissors', l: 'lizard',
  v: 'spock'
};
const WINNING_MATCH_NUM = 5;
let playerWins = 0;
let computerWins = 0;

function prompt(message) {
  console.log(`=> ${message}`);
}

function displayWinner(choice, computerChoice) {
  prompt(`You chose ${choice}, computer chose ${computerChoice}.`);

  if ((choice === 'rock' && computerChoice === 'scissors') ||
    (choice === 'scissors' && computerChoice === 'paper') ||
    (choice === 'paper' && computerChoice === 'rock') ||
    (choice === 'rock' && computerChoice === 'lizard') ||
    (choice === 'scissors' && computerChoice === 'lizard') ||
    (choice === 'lizard' && computerChoice === 'paper') ||
    (choice === 'lizard' && computerChoice === 'spock') ||
    (choice === 'spock' && computerChoice === 'rock') ||
    (choice === 'spock' && computerChoice === 'scissors') ||
    (choice === 'paper' && computerChoice === 'spock')) {
    prompt('You win!');
    return choice;
  } else if ((computerChoice === 'rock' && choice === 'scissors') ||
    (computerChoice === 'scissors' && choice === 'paper') ||
    (computerChoice === 'paper' && choice === 'rock') ||
    (computerChoice === 'rock' && choice === 'lizard') ||
    (computerChoice === 'scissors' && choice === 'lizard') ||
    (computerChoice === 'lizard' && choice === 'paper') ||
    (computerChoice === 'lizard' && choice === 'spock') ||
    (computerChoice === 'spock' && choice === 'rock') ||
    (computerChoice === 'spock' && choice === 'scissors') ||
    (computerChoice === 'paper' && choice === 'spock')) {
    prompt('Computer wins!');
    return computerChoice;
  } else {
    prompt("It's a tie!");
  }
}

console.clear();
prompt('Welcome to Rock, Paper, Scissors!');

while (true) {

  while (true) {
    prompt(`Score: Player: ${playerWins} -- Computer: ${computerWins}`);
    prompt('Best of 5 Rounds Wins the Match!')
    prompt(`Please type:\n 'r' for rock,\n 's' for scissors,\n 'p' for paper,\n` +
      ` 'l' for lizard,\n 'v' for spock`);
    let choice = VALID_CHOICES[rlSync.question()].toLowerCase();

    while (!Object.values(VALID_CHOICES).includes(choice)) {
      prompt("That's not a valid choice.");
      choice = VALID_CHOICES[rlSync.question()].toLowerCase();
    }

    let randomIndex = Math.floor(Math.random() *
      Object.values(VALID_CHOICES).length);
    let computerChoice = Object.values(VALID_CHOICES)[randomIndex];

    let winner = displayWinner(choice, computerChoice);

    if (winner === choice) {
      playerWins += 1;
    } else if (winner === computerChoice) {
      computerWins += 1;
    }

    prompt(`Updated Score:  Player ${playerWins} -- Computer ${computerWins}`);
    prompt('Do you want to play another round? (y/n)');
    let answer = rlSync.question().toLowerCase();
    while (answer[0] !== 'n' && answer !== 'y') {
      prompt("Please enter 'y' or 'n'.");
      answer = rlSync.question().toLowerCase();
    }

    console.clear();
    if (answer[0] === 'n') break;

  }
  prompt('Do you want to play another match of best of 5? (y/n)');
  let answer = rlSync.question().toLowerCase();
  while (answer[0] !== 'n' && answer !== 'y') {
    prompt("Please enter 'y' or 'n'.");
    answer = rlSync.question().toLowerCase();
  }
  console.clear();
  if (answer[0] === 'n') break;
}

prompt('Thank you for playing Rock, Paper, Scissors!');
