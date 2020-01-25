// Write a function that returns a list of all palindromic substrings of a string.That is, each substring must consist of a sequence of characters that reads the same forward and backward.The substrings in the returned list should be sorted by their order of appearance in the input string.Duplicate substrings should be included multiple times.

// You may(and should) use the substrings function you wrote in the previous exercise.

// For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not.In addition, assume that single characters are not palindromes.

function substringsAtStart(string) {
  let newStr = '';
  return string.split('').map(char => {
    newStr += char;
    return newStr;
  });
}

function substrings(string) {
  let result = [];
  let idx = 0;

  while (idx < string.length) {
    result.push(...substringsAtStart(string.slice(idx)));
    idx += 1;
  }

  return result;
}

function isPalindrome(string) {
  return string === string.split('').reverse().join('') && string.length >= 2;
}

function palindromes(string) {
  let substringsArr = substrings(string);

  return substringsArr.filter(substring => isPalindrome(substring));
}

palindromes('abcd');       // []
palindromes('madam');      // [ "madam", "ada" ]

palindromes('hello-madam-did-madam-goodbye');
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

palindromes('knitting cassettes');
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
