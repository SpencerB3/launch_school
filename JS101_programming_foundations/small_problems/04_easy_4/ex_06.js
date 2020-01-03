// Write a function that returns true if its integer argument is palindromic, or false otherwise.A palindromic number reads the same forwards and backwards.

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

function isPalindromicNumber(num) {
  return isPalindrome(String(num));
}

isPalindromicNumber(34543);        // true
isPalindromicNumber(123210);       // false
isPalindromicNumber(22);           // true
isPalindromicNumber(5);            // true
