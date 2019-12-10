// Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 120 (inclusive).
/*
1 - generate an age number - between 20 and 120 inclusive
log it to console

2 -have a min and max number arguments be part of a function
  -  Math.random times difference between max and min,  + 1 to get up to 100
  -  add min to provide base for value ( + 20)
  -  return number

- write a method definition that sets max and min parameters
  return the value of the result of the following operations
    - Math.random function multiplied by the difference of max minus min plus one
    - to that prosuct is added the minimum number
    -finally to that sum is appliied Max.floor to round rthe number down to an integer

4 - 5 function randomAge(min, max)
    return Math.floor(Math.random() * (max - min + 1) + min)
  end

*/

function randomAge(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

let teddyAge = randomAge(20, 120);
console.log(teddyAge);

// Example Output:

// Teddy is 69 years old!