// Write another function that returns true if the string passed as an argument is a palindrome, or false otherwise.This time, however, your function should be case -insensitive, and should ignore all non - alphanumeric characters.If you wish, you may simplify things by calling the isPalindrome function you wrote in the previous exercise.

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

function isRealPalindrome(string) {
  string = string.toLowerCase().replace(/[^a-z0-9]/g, '');
  return isPalindrome(string);
}

// function isRealPalindrome(string) {
//   string = removeNonAlphaNumeric(string.toLowerCase());
//   console.log(isPalindrome(string));
// }

// function removeNonAlphaNumeric(string) {
//   let result = '';

//   for (let i = 0; i < string.length; i += 1) {
//     if (isLetter(string[i]) || isNumber(string[i])) {
//       result += string[i];
//     }
//   }
//   return result;
// }

// function isNumber(char) {
//   return char >= '0' && char <= '9';
// }

// function isLetter(char) {
//   return char >= 'a' && char <= 'z'
// }

isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false
