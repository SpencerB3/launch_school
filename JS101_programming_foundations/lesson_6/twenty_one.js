// the player and dealer were given the same first card -- how?
// JSON
// validations
// fix aceAdd functiom


const rlSync = require('readline-sync');
const prompt = (message) => console.log(`=> ${message}`);

const SUITS = ['Hearts', 'Clubs', 'Diamonds', 'Spades'];
const VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen',
  'King', 'Ace'];

function initializeDeck() {
  let deck = [];
  SUITS.forEach(suit => {
    VALUES.forEach(value => {
      deck.push([suit, value]);
    });
  });
  return deck;
}

function shuffle(array) {
  for (let index = array.length - 1; index > 0; index--) {
    let otherIndex = Math.floor(Math.random() * (index + 1)); // 0 to index
    [array[index], array[otherIndex]] = [array[otherIndex], array[index]]; // swap elements
  }
}

function dealHand(deck) {
  let hand = [];
  hand.push(deck.shift());
  hand.push(deck.shift());
  return hand;
}

function busted(score) {
  if (score > 21) {
    return true;
  }
  return false;
}

function calculateHand(hand) {
  let sum = 0;
  hand.forEach(card => {
    if (['J', 'Q', 'K'].includes(card[1][0])) {
      sum += 10;
    } else if (card[1] === 'Ace') {
      sum += (addAce(sum));
    } else {
      sum += Number(card[1]);
    }
  });
  return sum;
}

function addAce(sum) {
  return ((sum + 11) > 21) ? 1 : 11;
}

function displayHand(finalHand) {
  return joinAnd(finalHand.map(card => {
    return `${card[1]} of ${card[0]}`;
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
  if (hand1 > hand2) {
    return 'Player';
  } else if (hand2 > hand1) {
    return 'Dealer';
  } else {
    return null;
  }
}

// --------- main code ----------

console.clear();
prompt('Welcome to Twenty-One! Press any key to be dealt a hand.');
rlSync.question();

while (true) {
  console.clear();
  let deck = initializeDeck();
  shuffle(deck);

  let playerHand = dealHand(deck);
  let dealerHand = dealHand(deck);

  prompt(`Player Hand: ${playerHand[0][1]} of ${playerHand[0][0]} and ` +
    `${playerHand[1][1]} of ${playerHand[1][0]}`);

  prompt(`Dealer Hand: ${dealerHand[0][1]} of ${playerHand[0][0]} and Mystery Card`);

  while (true) {
    prompt("Would you like to hit or stay? Type 's' to stay, " +
      "or any other key to hit");
    let answer = rlSync.question().toLowerCase(); // validate answer

    if (busted(calculateHand(playerHand)) || answer === 's') break;
    console.clear();
    playerHand.push(deck.shift());
    prompt(`Player Hand: ${displayHand(playerHand)}`);
    prompt(`Dealer Hand: ${dealerHand[0][1]} of ${playerHand[0][0]} and Mystery Card`);
  }

  if (busted(calculateHand(playerHand))) {
    prompt('You busted! =--> Dealer wins!  Would you like to play again?');
  } else {
    prompt('You chose to stay!');
  }

  while (true) {
    if (busted(calculateHand(dealerHand)) || calculateHand(dealerHand) >= 17) {
      break;
    }
    dealerHand.push(deck.shift());
  }

  let finalPlayerScore = calculateHand(playerHand);
  let finalDealerScore = calculateHand(dealerHand);

  if (busted(calculateHand(dealerHand))) {
    prompt('Dealer busts! =--> Player wins!');
  } else if (retrievieWinner(finalPlayerScore, finalDealerScore)) {
    prompt(`${retrievieWinner(finalPlayerScore, finalDealerScore)} is the winner!`);
  } else {
    prompt("It's a tie.");
  }

  prompt(`Player Hand: ${displayHand(playerHand)} - Score: ${calculateHand(playerHand)}`);
  prompt(`Dealer Hand: ${displayHand(dealerHand)} - Score: ${calculateHand(dealerHand)}`);

  prompt("Would you like to play again? Type 'y' to continue, " +
    "or any other key to exit");
  let playAgain = rlSync.question(); // validate
  if (playAgain[0] !== 'y') break;
  console.clear();
}

console.clear();
prompt('Thank you for playing Twenty-One!');
