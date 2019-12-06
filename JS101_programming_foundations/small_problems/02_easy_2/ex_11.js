// In the previous two exercises, you developed functions that convert simple numeric strings to signed integers.In this exercise and the next, you're going to reverse those functions.

// Write a function that converts a non - negative integer value(e.g., 0, 1, 2, 3, and so on) to the string representation of that integer.

// You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number.Your function should do this the old - fashioned way and construct the string by analyzing and manipulating the number.

/* i = num, o: string --> declare empty string, while loop getting divmod, prepend result to string, return string
set DIGITS object
set empty string
set while loop -> while number greater than 0
  number mod 10 prepended to string 
  number = number divided by ten
end looop
return string
*/

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

integerToString(4321);      // "4321"
integerToString(0);         // "0"
integerToString(5000);      // "5000"
integerToString(1234567890);      // "1234567890"
