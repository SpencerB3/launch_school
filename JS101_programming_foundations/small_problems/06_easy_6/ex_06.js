// Write a function that takes an integer argument, and returns an array containing all integers between 1 and the argument(inclusive), in ascending order.

// You may assume that the argument will always be a positive integer.

function sequence(num) {
  return [...Array(num + 1).keys()].slice(1);
  // let result = [];
  // [...Array(num).keys()].forEach(num => result.push(num + 1));
  // return result;
}

sequence(5);    // [1, 2, 3, 4, 5]
sequence(3);    // [1, 2, 3]
sequence(1);    // [1]
