// A collection of spelling blocks has two letters per block, as shown in this list:

// B: O   X: K   D: Q   C: P   N: A
// G: T   R: E   F: S   J: W   H: U
// V: I   L: Y   Z: M
// This limits the words you can spell with the blocks to only those words that do not use both letters from any given block.You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise.You can consider the letters to be case -insensitive when you apply the rules.

function isBlockWord(word) {
  let blocks = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];

  for (idx = 0; idx < word.length; idx += 1) {
    let index = blocks
                .findIndex(block => block.includes(word[idx].toUpperCase()));
    if (index < 0) {
      return false;
    }
    blocks.splice(index, 1);
  }
  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));     // true