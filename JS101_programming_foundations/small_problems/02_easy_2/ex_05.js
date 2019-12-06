// Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power.Do not worry about validating the input.

// ==> Enter the first number:
// 23
// ==> Enter the second number:
// 17
// ==> 23 + 17 = 40
// ==> 23 - 17 = 6
// ==> 23 * 17 = 391
// ==> 23 / 17 = 1
// ==> 23 % 17 = 6
// ==> 23 ** 17 = 141050039560662968926103

const rlSync = require('readline-sync');
const log = (message) => console.log(`==> ${message}`);

log("Enter the first number:");
let num1 = parseInt(rlSync.prompt(), 10);

log("Enter the second number:");
let num2 = parseInt(rlSync.prompt(), 10);

log(`${num1} + ${num2} = ${num1 + num2}`);
log(`${num1} - ${num2} = ${num1 - num2}`);
log(`${num1} * ${num2} = ${num1 * num2}`);
log(`${num1} / ${num2} = ${num1 / num2}`);
log(`${num1} % ${num2} = ${num1 % num2}`);
log(`${num1} ** ${num2} = ${num1 ** num2}`);
