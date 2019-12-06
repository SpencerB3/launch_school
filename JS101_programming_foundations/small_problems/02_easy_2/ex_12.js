// In the previous exercise, you developed a function that converts non - negative numbers to strings.In this exercise, you're going to extend that function by adding the ability to represent negative numbers as well.

// Write a function that takes an integer, and converts it to a string representation.

// You may not use any of the standard conversion functions available in JavaScript, such as String() and Number.prototype.toString().You may, however, use integerToString() from the previous exercise.

// You might also want to check the Math.sign() function.

const STR_NUMS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(number) {
  let result = '';
  do {
    let mod = number % 10;
    result = STR_NUMS[mod] + result;
    number = Math.floor((number / 10));
  } while (number > 0);
  return result;
}

function signedIntegerToString(number) {
  switch (Math.sign(number)) {
    case +1:
      return `+${integerToString(number)}`;
    case -1:
      return `-${integerToString(-number)}`;
    default:
      return integerToString(number);
  }
}

console.log(signedIntegerToString(4321) === "+4321");
console.log(signedIntegerToString(-123) === "-123");
console.log(signedIntegerToString(0) === "0");
