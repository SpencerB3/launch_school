// Write a program that solicits six numbers from the user, then logs a message that describes whether or not the sixth number appears amongst the first five numbers.

const rlSync = require('readline-sync');
let numbers = [];

numbers.push(rlSync.questionFloat("Enter the first number:\n"));
numbers.push(rlSync.questionFloat("Enter the second number:\n"));
numbers.push(rlSync.questionFloat("Enter the third number:\n"));
numbers.push(rlSync.questionFloat("Enter the fourth number:\n"));
numbers.push(rlSync.questionFloat("Enter the fifth number:\n"));
let lastNum = (rlSync.questionFloat("Enter the last number:\n"));

if (array.includes(lastNum)) {
  console.log(`The number ${lastNum} appears in ${numbers}.`);
} else {
  console.log(`The number ${lastNum} does not appear in ${numbers}.`)
}
