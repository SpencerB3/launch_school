const rlSync = require('readline-sync');
let prompt = (message) => console.log(`=> ${message}`);

const INITIAL_MARKER = ' ';
const HUMAN_MARKER = 'X';
const COMPUTER_MARKER = 'O';
const WINNING_MATCH_NUM = 5;
const WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
[3, 6, 9], [1, 5, 9], [3, 5, 7]];
const SQUARE_FIVE = 5;
const FIRST_MOVE = ['Player', 'Computer'];

function displayBoard(board, score1, score2) {
  console.clear();

  console.log(`You are ${HUMAN_MARKER}.  The computer is ${COMPUTER_MARKER}.`);
  console.log(`Your score is ${score1} -- Computer score is ${score2}`);

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

    prompt("That's not a valid choice.");
  }

  board[square] = HUMAN_MARKER;
}

function computerChoosesSquare(board) {
  let square;

  for (let idx = 0; idx < WINNING_LINES.length; idx += 1) {
    let line = WINNING_LINES[idx];
    square = findAtRiskSquare(line, board, COMPUTER_MARKER);
    if (square) break;
  }

  if (!square) {
    for (let idx = 0; idx < WINNING_LINES.length; idx += 1) {
      let line = WINNING_LINES[idx];
      square = findAtRiskSquare(line, board, HUMAN_MARKER);
      if (square) break;
    }
  }
  
  if (!square && board[SQUARE_FIVE] === ' ') {
    square = SQUARE_FIVE;
  }

  if (!square) {
    let randomIndex = Math.floor(Math.random() * emptySquares(board).length);
    square = emptySquares(board)[randomIndex];
  }
  board[square] = COMPUTER_MARKER;
}

function emptySquares(board) {
  return Object.keys(board).filter(key => board[key] === INITIAL_MARKER);
}

function joinOr(array, delimiter = ",", word = 'or') {
  switch (array.length) {
    case 0: return '';
    case 1: return `${array[0]}`;
    case 2: return `${array[0]} ${word} ${array[1]}`;
    default: return `${array.slice(0, array.length - 1).join(`${delimiter} `)}` +
      ` ${word} ${array[array.length - 1]}`;
  }
}

function boardFull(board) {
  return emptySquares(board).length === 0;
}

function detectWinner(board) {
  for (let line = 0; line < WINNING_LINES.length; line += 1) {
    let [sq1, sq2, sq3] = WINNING_LINES[line];
    if (
      board[sq1] === HUMAN_MARKER &&
      board[sq2] === HUMAN_MARKER &&
      board[sq3] === HUMAN_MARKER
    ) {
      return 'Player';
    } else if (
      board[sq1] === COMPUTER_MARKER &&
      board[sq2] === COMPUTER_MARKER &&
      board[sq3] === COMPUTER_MARKER
    ) {
      return 'Computer';
    }
  }
  return null;
}

function someoneWon(board) {
  return !!detectWinner(board);
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

// function firstMove(first, board) {
//   first === 'Player' ? playerChoosesSquare(board) : computerChoosesSquare(board);
// }

// function secondMove(first, board) {
//   first === 'Player' ? computerChoosesSquare(board) : playerChoosesSquare(board);
// }

function retrieveFirstPlayer() {
  let randomIndex = Math.floor(Math.random() * 2);
  return FIRST_MOVE[randomIndex];
}

// ---------main code-----------

prompt('Welcome to Tic Tac Toe.  First to win 5 rounds wins the match!')

while (true) {
  let playerScore = 0;
  let computerScore = 0;
  let firstPlayer = retrieveFirstPlayer();

  while (true) {
    let board = initializeBoard();

    while (true) {
      displayBoard(board, playerScore, computerScore);

      // firstMove(firstGo, board);
      playerChoosesSquare(board);
      if (someoneWon(board) || boardFull(board)) break;

      // secondMove(firstGo, board);
      computerChoosesSquare(board);
      if (someoneWon(board) || boardFull(board)) break;
    }
    displayBoard(board, playerScore, computerScore);

    if (someoneWon(board)) {
      detectWinner(board) === 'Player' ? playerScore += 1 : computerScore += 1;
      prompt(`${detectWinner(board)} won!`);
    } else {
      prompt("It's a tie!");
    }

    if (playerScore === WINNING_MATCH_NUM || computerScore === WINNING_MATCH_NUM) {
      prompt(`${detectWinner(board)} has won the match!`);
      break;
    }
   
    prompt('Press any key to continue, Q to quit');
    let answer = rlSync.question().toLowerCase();
    if (answer[0] === 'q') break
  }

  prompt('Play another match? (y or n)');
  let answer = rlSync.question();
  if (answer[0] !== 'y') break;
}

console.clear();
prompt('Thank you for playing Tic Tac Toe!');
