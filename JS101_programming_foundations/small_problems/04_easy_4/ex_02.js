// Write a program that solicits six numbers from the user, then logs a message that describes whether or not the sixth number appears amongst the first five numbers.

/*
1 -
get and set six numbers
log a message saying whether the sixth number is a repetition of the first 5

2 - 
ask for input of numbers six times, store first five entries in an array, and then test whether the sixth number matches with any elements in that array (boolean)

set readline const
set set empty array
get number one - set to variable, push to new array
repeat in total five times
get number six, set to variable
set conditional statement
  if number 6 is in array
    log statement
  else if not
    log another statement
  end
end

4 -
set readline constant to access library
set empty array

get number 1
set to variable
push to array
... (repeat till a total of five numbers are collected)

get number 6
set to variable

if number six matches a number in the array
  log equivalent of "The number 17 appears in 25, 15, 20, 17, 23" 
else
  log "The number 18 does not appear in 25, 15, 20, 17, 23."
end
*/

const rlSync = require('readline-sync');
let numbers = [];
const log = (message) => console.log(`=> ${message}`);

log("Enter the 1st number");
numbers.push(Number(rlSync.prompt()));

log("Enter the 2nd number");
numbers.push(Number(rlSync.prompt()));

log("Enter the 3rd number");
numbers.push(Number(rlSync.prompt()));

log("Enter the 4th number");
numbers.push(Number(rlSync.prompt()));

log("Enter the 5th number");
numbers.push(Number(rlSync.prompt()));

log("Enter the 6th number");
let number6 = Number(rlSync.prompt());

if (numbers.includes(number6)) {
  log(`The number ${number6} appears in ${numbers}.`);
} else {
  log(`The number ${number6} does not appear in ${numbers}.`);
}

//   Examples:

// Enter the 1st number: 25
// Enter the 2nd number: 15
// Enter the 3rd number: 20
// Enter the 4th number: 17
// Enter the 5th number: 23
// Enter the last number: 17

// The number 17 appears in 25, 15, 20, 17, 23.

// -----

//   Enter the 1st number: 25
// Enter the 2nd number: 15
// Enter the 3rd number: 20
// Enter the 4th number: 17
// Enter the 5th number: 23
// Enter the last number: 18

// The number 18 does not appear in 25, 15, 20, 17, 23.
