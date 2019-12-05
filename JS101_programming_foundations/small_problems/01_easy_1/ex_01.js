// Write a function that takes one integer argument, which may be positive, negative, or zero.This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

/*
input: number, output: boolean
input will always be a number, 0 is in test cases, negatives works equally well, no edge cases like floats

absolute value? - Math.abs

no new variables needed 

no iteration, just conditional statement
returning of conditional statement
*/

function isOdd(num) {
  return Math.abs(num) % 2 === 1;
}

console.log(isOdd());
console.log(isOdd(2)); // => false
console.log(isOdd(5)); // => true
console.log(isOdd(-17)); // => true
console.log(isOdd(-8)); // => false
console.log(isOdd(0)); // => false
console.log(isOdd(7)); // => true
