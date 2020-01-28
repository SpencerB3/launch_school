// Write a function that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase; false otherwise.Ignore characters that are not alphabetic.

function isUppercase(string) {
  let cleanStr = cleanString(string);
  return cleanStr.split('').every(char => char === char.toUpperCase());
}

function cleanString(string) {
  return string.replace(/[^a-z]/gi, "");
}

isUppercase('t');               // false
isUppercase('T');               // true
isUppercase('Four Score');      // false
isUppercase('FOUR SCORE');      // true
isUppercase('4SCORE!');         // true
isUppercase('');                // true
