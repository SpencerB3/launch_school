// Write a function that takes a String of digits, and returns the appropriate number as an integer.You may not use any of the methods mentioned above.

// For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

// You may not use any of the standard conversion methods available in JavaScript, such as String() and Number().Your function should do this the old - fashioned way and calculate the result by analyzing the characters in the string.

/*
i: string o: number, problem: convet string to number --> use map to get isolated siingle
set DIGITS const outside function
set function
  map transformation on split string, 
    reassign value to DIGITS
  set value to 0
  loop through new array
    add to value, mult by 10
  return value
*/

const DIGITS = {
  0: 0,
  1: 1,
  2: 2,
  3: 3,
  4: 4,
  5: 5,
  6: 6,
  7: 7,
  8: 8,
  9: 9
};

function stringToInteger(string) {
  let array = string.split('').map( num => DIGITS[num] );
  let value = 0;
  array.forEach( num => value = (value * 10) + num )
  return value;
}

console.log(stringToInteger("4321") === 4321); // logs true
console.log(stringToInteger("570") === 570); // logs true
