// Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

// Write a function that takes an integer as an argument, and returns the maximum rotation of that integer.You can(and probably should) use the rotateRightmostDigits function from the previous exercise.

/*
Input
  number
Output
  new number
Rules
  set number string
  set count as number string 's length

  set for loop, starting at count, going to 1, sends string to rRD function

  take first number and rotate it to the left
  take second number and rotate it to the left
  continue until final two digits are rotated
*/

function maxRotation(number) {
  let length = String(number).length;

  for (let idx = length; idx >= 2; idx -= 1) {
    number = rotateRightmostDigits(number, idx);
  }
  return number;
}

function rotateString(string) {
  return string.slice(1) + string[0];
}

function rotateRightmostDigits(number, count) {
  let stringNum = String(number);

  let firstPart = stringNum.slice(0, stringNum.length - count);
  let secondPart = stringNum.slice(stringNum.length - count);
  let resultString = firstPart + rotateString(secondPart);

  return Number(resultString);
}

maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845