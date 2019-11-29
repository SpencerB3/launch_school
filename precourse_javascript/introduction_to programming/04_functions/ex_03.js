// Write a program that uses a multiply method to multiply two numbers and returns the result.Ask the user to enter the two numbers, then output the numbers and result as a simple equation.

let rlSync = require('readline-sync');

function multiply(num1, num2) {
  return num1 * num2;
}

function getNumber(prompt) {
  return Number(rlSync.question(prompt)) 
}

let num1 = getNumber('Enter the first number: ')
let num2 = getNumber('Enter the second number: ')
let product = multiply(num1, num2)

console.log(`${num1} * ${num2} is equal to ${product}`);
