// Write a function that returns true if the string passed as an argument is a palindrome, or false otherwise.A palindrome reads the same forwards and backwards.For this problem, the case matters and all characters matter.

// string => boolean
// return whether string is same 

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

isPalindrome('madam');               // true
isPalindrome('Madam');               // false (case matters)
isPalindrome("madam i'm adam");      // false (all characters matter)
isPalindrome('356653');              // true
