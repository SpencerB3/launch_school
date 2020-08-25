const rlSync = require('readline-sync');
const MESSAGES = require('./tictactoe_messages.json');

const INITIAL_MARKER = ' ';
const PLAYER_MARKER = 'X';
const COMPUTER_MARKER = 'O';
const WINNING_MATCH = 5;
const WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
  [3, 6, 9], [1, 5, 9], [3, 5, 7]];
const SQUARE_FIVE = 5;
const PLAYERS = ['Player', 'Computer'];
const VALID_ANSWERS = ['y', 'yes', 'n', 'no'];
let scores = { player: 0, computer: 0 };
let winner;

let prompt = (message) => console.log(`=> ${message}`);

function displayBoard(board, scores) {

  console.log(`You are ${PLAYER_MARKER}.  The computer is ${COMPUTER_MARKER}.`);
  console.log(`Player: ${scores.player} -- Computer: ${scores.computer}`);

  console.log('');
  console.log('     |     |');
  console.log(`  ${board['1']}  |  ${board['2']}  |  ${board['3']}`);
  console.log('     |     |');
  console.log('-----|-----|-----');
  console.log('     |     |');
  console.log(`  ${board['4']}  |  ${board['5']}  |  ${board['6']}`);
  console.log('     |     |');
  console.log('-----|-----|-----');
  console.log('     |     |');
  console.log(`  ${board['7']}  |  ${board['8']}  |  ${board['9']}`);
  console.log('     |     |');
  console.log('');
}

function initializeBoard() {
  let board = {};
  for (let idx = 1; idx <= 9; idx += 1) {
    board[String(idx)] = INITIAL_MARKER;
  }
  return board;
}

function playerChoosesSquare(board) {
  let square;

  while (true) {
    prompt(`Choose a square: ${joinOr(emptySquares(board))}:`);
    square = rlSync.question().trim();

    if (emptySquares(board).includes(square)) break;

    prompt(MESSAGES['invalidChoice']);
  }

  board[square] = PLAYER_MARKER;
}

function computerChoosesSquare(board) {
  let square = retrieveSquare(board, COMPUTER_MARKER);

  if (!square) {
    square = retrieveSquare(board, PLAYER_MARKER);
  }

  if (!square && board[SQUARE_FIVE] === ' ') {
    square = SQUARE_FIVE;
  }

  if (!square) {
    square = findRandomSquare(board);
  }
  board[square] = COMPUTER_MARKER;
}

function retrieveSquare(board, marker) {
  let square;
  for (let idx = 0; idx < WINNING_LINES.length; idx += 1) {
    let line = WINNING_LINES[idx];
    square = findAtRiskSquare(line, board, marker);
    if (square) break;
  }
  return square;
}

function findRandomSquare(board) {
  let square;
  let randomIndex = Math.floor(Math.random() * emptySquares(board).length);
  square = emptySquares(board)[randomIndex];
  return square;
}

function emptySquares(board) {
  return Object.keys(board).filter(key => board[key] === INITIAL_MARKER);
}

function joinOr(array, delimiter = ",", word = 'or') {
  switch (array.length) {
    case 0: return '';
    case 1: return `${array[0]}`;
    case 2: return `${array[0]} ${word} ${array[1]}`;
    default: return `${array.slice(0, array.length - 1).join(`${delimiter} `)},` +
      ` ${word} ${array[array.length - 1]}`;
  }
}

function boardFull(board) {
  return emptySquares(board).length === 0;
}

function detectWinner(board, marker, player) {
  for (let line = 0; line < WINNING_LINES.length; line += 1) {
    let [sq1, sq2, sq3] = WINNING_LINES[line];
    if (
      board[sq1] === marker &&
      board[sq2] === marker &&
      board[sq3] === marker
    ) {
      return player;
    }
  }
  return null;
}

function someoneWon(board) {
  return !!detectWinner(board, PLAYER_MARKER, PLAYERS[0]) ||
    !!detectWinner(board, COMPUTER_MARKER, PLAYERS[1]);
}

function findAtRiskSquare(line, board, marker) {
  let markersInLine = line.map(square => board[square]);
  debugger;
  if (markersInLine.filter(val => val === marker).length === 2) {
    let unusedSquare = line.find(square => board[square] === INITIAL_MARKER);
    if (unusedSquare !== undefined) {
      return unusedSquare;
    }
  }
  return null;
}

function chooseSquare(board, currentPlayer) {
  return currentPlayer === 'Player' ? playerChoosesSquare(board) :
    computerChoosesSquare(board);
}

function alternatePlayer(currentPlayer) {
  return currentPlayer === 'Player' ? 'Computer' : 'Player';
}

function retrieveFirstPlayer() {
  let answer = rlSync.question().toLowerCase();
  while (isInvalidAnswer(answer)) {
    prompt(MESSAGES['invalidChoice']);
    answer = rlSync.question().toLowerCase();
  }
  let firstMove = answer[0] === 'y' ? '0' : '1';
  return PLAYERS[firstMove];
}

function retrieveAnswer() {
  let answer = rlSync.question().toLowerCase();
  while (isInvalidAnswer(answer)) {
    prompt(MESSAGES['invalidChoice']);
    answer = rlSync.question().toLowerCase();
  }
  return answer;
}

function isInvalidAnswer(answer) {
  return !VALID_ANSWERS.includes(answer);
}

function updateScore(board, scores) {
  if (detectWinner(board, PLAYER_MARKER, PLAYERS[0]) === 'Player') {
    scores.player += 1;
    return scores;
  } else {
    scores.computer += 1;
    return scores;
  }
}

// ---------main code-----------

console.clear();
prompt(MESSAGES['welcome']);

while (true) {
  scores = { player: 0, computer: 0 };

  prompt(MESSAGES['firstPlayer']);
  let currentPlayer = retrieveFirstPlayer();
  console.clear();

  while (true) {
    let board = initializeBoard();

    while (true) {
      console.clear();
      displayBoard(board, scores);
      chooseSquare(board, currentPlayer);
      currentPlayer = alternatePlayer(currentPlayer);
      if (someoneWon(board) || boardFull(board)) break;
    }

    console.clear();
    displayBoard(board, scores);

    if (someoneWon(board)) {
      scores = updateScore(board, scores);
      winner = detectWinner(board, PLAYER_MARKER, PLAYERS[0]) ||
        detectWinner(board, COMPUTER_MARKER, PLAYERS[1]);
      prompt(`${winner} won!`);
    } else {
      prompt(MESSAGES['tie']);
    }

    if (scores.player === WINNING_MATCH || scores.computer === WINNING_MATCH) {
      prompt(`${winner} has won the match!`);
      break;
    }

    prompt(MESSAGES['continue']);
    let anotherRound = rlSync.question().toLowerCase();
    if (anotherRound[0] === 'q') break;
  }

  prompt(MESSAGES['anotherMatch']);
  let answer = retrieveAnswer();
  if (answer[0] !== 'y') break;

  console.clear();
}

console.clear();
prompt(MESSAGES['thankYou']);
