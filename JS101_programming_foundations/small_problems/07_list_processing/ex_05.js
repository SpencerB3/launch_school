// Write a function that returns a list of all substrings of a string.Order the returned list by where in the string the substring begins.This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on.Since multiple substrings will occur at each position, return the substrings at a given position from shortest to longest.

// You may(and should) use the substringsAtStart function you wrote in the previous exercise:

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

substrings('abcde');

// returns
// ["a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e"]
