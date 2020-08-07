// Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.

// You may assume that every word contains at least one letter, and that the string will always contain at least one word.You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.

// using map

function swap(string) {
  return string.split(' ').map((word) => {
    if (word.length === 1) return word;
    return word[word.length - 1] + word.slice(1, -1) + word[0];
  }).join(' ');
}

// function swap(string) {
//   let result = [];
//   string.split(' ').forEach((word)=> {
//     let newWord = letterSwap(word);
//     result.push(newWord);
//   });
//   return result.join(' ');
// }

// function letterSwap(word) {
//   if (word.length === 1) {
//     return word;
//   }
//   return word[word.length - 1] + word.slice(1, -1) + word[0];
// }

swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"
