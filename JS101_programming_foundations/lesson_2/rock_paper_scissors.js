const rlSync = require('readline-sync');
const MESSAGES = require('./rock_paper_scissors_messages.json');
const VALID_CHOICES = { r: 'rock', p: 'paper', s: 'scissors', l: 'lizard',
  v: 'spock'
};
const VALID_ANSWERS = ['y', 'yes', 'n', 'no'];
const WINNING_MATCH_NUM = 5;
const WINNING_HANDS = { rock: ['scissors', 'lizard'], paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'], lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors'] };

let SCORE = { player: 0, computer: 0 };

function prompt(message) {
  console.log(`=> ${message}`);
}

let retrieveChoice = () => {
  let choice = VALID_CHOICES[rlSync.question().toLowerCase()];

  while (!Object.values(VALID_CHOICES).includes(choice)) {
    prompt(MESSAGES['invalidChoice']);
    choice = VALID_CHOICES[rlSync.question().toLowerCase()];
  }
  return choice;
};

let retrieveRandomIndex = () =>  {
  return Math.floor(Math.random() * Object.values(VALID_CHOICES).length);
};

let retrieveComputerChoice = (index) => Object.values(VALID_CHOICES)[index];

function displayWinner(winner, choice, computerChoice) {
  if (winner === choice) {
    prompt('You win!');
  } else if (winner === computerChoice) {
    prompt('Computer wins!');
  } else {
    prompt("It's a tie!");
  }
}

function retrieveRoundWinner(player1, player2) {
  if (WINNING_HANDS[player1].includes(player2)) {
    return player1;
  } else if (WINNING_HANDS[player2].includes(player1)) {
    return player2;
  }
  return undefined;
}

let updateScore = (winner, choice, computerChoice) => {
  if (winner === choice) {
    SCORE.player += 1;
  } else if (winner === computerChoice) {
    SCORE.computer += 1;
  }
};

let retrieveMatchWinner = () => {
  if (SCORE.player === WINNING_MATCH_NUM) {
    return true;
  } else if (SCORE.computer === WINNING_MATCH_NUM) {
    return true;
  }
  return undefined;
};

let retrieveAnswer = () => {
  let answer = rlSync.question().toLowerCase();
  while (isInvalidAnswer(answer)) {
    prompt("Please enter 'y' or 'n'.");
    answer = rlSync.question().toLowerCase();
  }
  return answer;
};

let continueMatch = () => {
  let answer = rlSync.question().toLowerCase();
  return answer === 'q' ? false : true;
}

function isInvalidAnswer(answer) {
  return (!VALID_ANSWERS.includes(answer.toLowerCase()));
}

let resetScore = () => {
  SCORE.player = 0;
  SCORE.computer = 0;
};

let isAnswerNo = answer => answer[0] === 'n';
// ------- main code ----------

console.clear();
prompt(MESSAGES['greeting']);

while (true) {

  while (true) {
    prompt(MESSAGES['matchConditions']);
    prompt(`Score: Player: ${SCORE.player} -- Computer: ${SCORE.computer}`);
    prompt(MESSAGES['retrieveHand']);

    let choice = retrieveChoice();
    console.clear();

    let randomIndex = retrieveRandomIndex();

    let computerChoice = retrieveComputerChoice(randomIndex);

    prompt(`You chose ${choice}, computer chose ${computerChoice}.`);

    let winner = retrieveRoundWinner(choice, computerChoice);
    displayWinner(winner, choice, computerChoice);
    updateScore(winner, choice, computerChoice);

    if (retrieveMatchWinner() === SCORE.player) {
      prompt(MESSAGES['playerWon']);
      break;
    } else if (retrieveMatchWinner() === SCORE.computer) {
      prompt(MESSAGES['computerWon']);
      break;
    }

    prompt(`Updated Score:  Player ${SCORE.player} -- Computer ${SCORE.computer}`);
    
    prompt(MESSAGES['playRound']);
    let answer = continueMatch();

    if (!answer) break;
    console.clear();
  }
  prompt(MESSAGES['playMatch']);
  let answer = retrieveAnswer();

  console.clear();
  if (isAnswerNo(answer)) break;
  resetScore();
}

prompt(MESSAGES['goodbye']);
