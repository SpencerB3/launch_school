// Write a program that asks the user to enter an integer greater than 0, then asks whether the user wants to determine the sum or the product of all numbers between 1 and the entered integer, inclusive.

//   Examples:

// Please enter an integer greater than 0: 5
// Enter "s" to compute the sum, or "p" to compute the product.s

// The sum of the integers between 1 and 5 is 15.

// Please enter an integer greater than 0: 6
// Enter "s" to compute the sum, or "p" to compute the product.p

// The product of the integers between 1 and 6 is 720.

let rlSync = require('readline-sync');

function findSum(num) {
  let sum = 0
  for (let i = 0; i <= num; i += 1) {
    sum += i;
  }
  return sum;
}

function findProduct(num) {
  let product = 1;
  for(let i = 1; i <= num; i += 1) {
    product *= i;
  }
  return product;
}

console.log("Please enter an integer greater than 0:");
let integer = Number(rlSync.prompt());
// let integer = Number(rlSync.question("Please enter an integer greater than 0:\n"));

console.log("Enter 's' to compute the sum, or 'p' to compute the product:")
let operation = rlSync.prompt();
// let operation = rlSync.question("Enter 's' to compute the sum, or 'p' to compute the product\n").toLowerCase();

let sum = findSum(integer);
let product = findProduct(integer);

if (operation === 's') {
  console.log(`The sum of the integers between 1 and ${integer} is ${sum}.`);
} else {
  console.log(`The product of the integers between 1 and ${integer} is ${product}.`)
}
