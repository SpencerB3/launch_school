const rlSync = require('readline-sync');
const MESSAGES = require('./twenty_one_messages.json');

const SUITS = ['Hearts', 'Clubs', 'Diamonds', 'Spades'];
const VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen',
  'King', 'Ace'];
const BLACKJACK = 21;
const WIN_MATCH = 5;
let roundsWon;
let winner;

const prompt = (message) => console.log(`=> ${message}`);

function initializeDeck() {
  let deck = [];
  SUITS.forEach(suit => {
    VALUES.forEach(value => {
      deck.push({ value: value, suit: suit });
    });
  });
  return deck;
}

function shuffle(array) {
  for (let index = array.length - 1; index > 0; index--) {
    let otherIndex = Math.floor(Math.random() * (index + 1));
    [array[index], array[otherIndex]] = [array[otherIndex], array[index]];
  }
}

function dealHand(deck) {
  let hand = [];
  hand.push(deck.shift(), deck.shift());
  return hand;
}

function displayRound(roundsWon, playerHand, dealerHand, playerScore) {
  prompt(`Player Rounds Won: ${roundsWon.player} -- Dealer Rounds Won: ${roundsWon.dealer}`);
  prompt(MESSAGES['line']);
  prompt(`Player Hand: ${displayHand(playerHand)} - Score: ${playerScore}`);
  prompt(`Dealer Hand: ${dealerHand[0].value} of ${playerHand[0].suit} and Mystery Card`);
}

function displayEndRound(playerHand, playerScore, dealerHand, dealerScore) {
  prompt(`Player Hand: ${displayHand(playerHand)} - Score: ${playerScore}`);
  prompt(`Dealer Hand: ${displayHand(dealerHand)} - Score: ${dealerScore}`);
}

function retrieveAnswer() {
  let answer = rlSync.question().toLowerCase();
  while (!['s', 'h'].includes(answer)) {
    prompt(MESSAGES['invalidAnswer']);
    answer = rlSync.question().toLowerCase();
  }
  return answer;
}

function isBusted(score) {
  if (score > BLACKJACK) {
    return true;
  }
  return false;
}

function calculateHand(hand) {
  let sum = 0;

  hand.forEach(card => {
    if (['Jack', 'Queen', 'King'].includes(card.value)) {
      sum += 10;
    } else if (card.value === 'Ace') {
      sum += 11;
    } else {
      sum += Number(card.value);
    }
  });
  return verifyAce(sum, hand);
}

function verifyAce(sum, hand) {
  hand.filter(card => card.value === 'Ace').forEach(_ => {
    if (isBusted(sum)) {
      sum -= 10;
    }
  });
  return sum;
}

function displayHand(finalHand) {
  return joinAnd(finalHand.map(card => {
    return `${card.value} of ${card.suit}`;
  }));
}

function joinAnd(array, delimiter = ",", word = 'and') {
  switch (array.length) {
    case 0: return '';
    case 1: return `${array[0]}`;
    case 2: return `${array[0]} ${word} ${array[1]}`;
    default: return `${array.slice(0, array.length - 1).join(`${delimiter} `)},` +
      ` ${word} ${array[array.length - 1]}`;
  }
}

function retrievieWinner(hand1, hand2) {
  if (hand1 > BLACKJACK) {
    return 'Dealer';
  } else if (hand2 > BLACKJACK) {
    return 'Player';
  } else if (hand1 > hand2) {
    return 'Player';
  } else if (hand2 > hand1) {
    return 'Dealer';
  } else {
    return null;
  }
}

function updateRoundsWon(roundsWon, winner) {
  if (winner === 'Player') {
    roundsWon.player += 1;
  } else {
    roundsWon.dealer += 1;
  }
  return roundsWon;
}

function retrievePlayAgain() {
  let answer = rlSync.question().toLowerCase();
  while (!['yes', 'y', 'n', 'no'].includes(answer)) {
    prompt(MESSAGES['invalidChoice']);
    answer = rlSync.question().toLowerCase();
  }
  return answer;
}

// --------- main program run ----------

console.clear();
prompt(MESSAGES['welcome']);
rlSync.question();

while (true) {
  console.clear();
  roundsWon = { player: 0, dealer: 0 };

  while (true) {
    let deck = initializeDeck();
    shuffle(deck);

    let playerHand = dealHand(deck);
    let dealerHand = dealHand(deck);
    let playerScore = calculateHand(playerHand);
    let dealerScore = calculateHand(dealerHand);

    displayRound(roundsWon, playerHand, dealerHand, playerScore);

    while (true) {
      prompt(MESSAGES['line']);
      prompt(MESSAGES['stayOrHit']);
      let answer = retrieveAnswer();

      if (answer === 'h') {
        console.clear();
        playerHand.push(deck.shift());
        playerScore += calculateHand([playerHand[playerHand.length - 1]]);
        displayRound(roundsWon, playerHand, dealerHand, playerScore);
      }

      if (isBusted(playerScore) || answer === 's') break;
    }

    if (isBusted(playerScore)) {
      console.clear();
      prompt(MESSAGES['busts']);
      prompt(MESSAGES['line']);
    } else {
      console.clear();
      prompt(MESSAGES['stayed']);
      prompt(MESSAGES['line']);
    }

    while (!isBusted(playerScore)) {
      if (isBusted(dealerScore) || dealerScore >= 17) break;
      dealerHand.push(deck.shift());
      dealerScore += calculateHand([dealerHand[dealerHand.length - 1]]);
    }

    if (isBusted(dealerScore)) {
      prompt(MESSAGES['dealerBusts']);
      prompt(MESSAGES['line']);
    }

    winner = retrievieWinner(playerScore, dealerScore);

    if (!winner) {
      displayEndRound(playerHand, playerScore, dealerHand, dealerScore);
      prompt(MESSAGES['tie']);
    } else {
      displayEndRound(playerHand, playerScore, dealerHand, dealerScore);
      console.log(`${MESSAGES['wonRound']}`, winner);
      roundsWon = updateRoundsWon(roundsWon, winner);
    }

    if (roundsWon.player === WIN_MATCH || roundsWon.dealer === WIN_MATCH) {
      prompt(MESSAGES['line']);
      console.log(`${MESSAGES['wonMatch']}`, winner);
      break;
    }

    prompt(MESSAGES['line']);
    prompt(MESSAGES['continue']);
    let anotherRound = rlSync.question().toLowerCase();
    if (anotherRound[0] === 'q') break;
    console.clear();
  }

  prompt(MESSAGES['line']);
  prompt(MESSAGES['playAgain']);
  let playAgain = retrievePlayAgain();
  if (playAgain[0] !== 'y') break;
}

console.clear();
prompt(MESSAGES['thankYou']);
