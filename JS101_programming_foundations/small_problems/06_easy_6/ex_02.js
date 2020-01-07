// Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string.The function should not double vowels('a', 'e', 'i', 'o', 'u'), digits, punctuation, or whitespace.

function doubleConsonants(string) {
  const CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
    'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];
  let doubleStr = '';
  for (let i = 0; i < string.length; i += 1) {
    doubleStr += string[i];
    if (CONSONANTS.includes(string[i].toLowerCase())) {
      doubleStr += (string[i]);
    } 
  }
  return doubleStr;
}

doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""
