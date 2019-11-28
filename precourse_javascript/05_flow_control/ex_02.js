// Write a function, evenOrOdd, that determines whether its argument is an even number.If it is, the function should log 'even' to the console; otherwise, it should log 'odd'.For now, assume that the argument is always an integer.

function evenOrOdd(num) {
  if (num % 2 === 0) {
    console.log('even');
  } else {
    console.log('odd');
  }
}

evenOrOdd(5);
evenOrOdd(6);
evenOrOdd(0);
