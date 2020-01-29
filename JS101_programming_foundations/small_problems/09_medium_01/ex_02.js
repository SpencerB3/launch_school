// Write a function that rotates the last count digits of a number.To perform the rotation, move the first of the digits that you want to rotate to the end and shift the remaining digits to the left.

/*
Input:
  number
  count to rotate

Output:
  new number

Rules:
  rotate the last count digit of the number argument
  leave the first digits in order
  apply the same rule from the last exercise - slice of the 1st digit to rotate,
    append it to the end
  join the first digits to count rotated digits and return it
*/

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

rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
