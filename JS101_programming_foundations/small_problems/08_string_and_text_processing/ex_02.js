// Write a function that takes an array of strings, and returns an array of the same values with all vowels(a, e, i, o, u) removed.

function removeVowels(array) {
  return array.map(string => string.replace(/[aeiou]/gi, ""));
}

removeVowels(['abcdefghijklmnopqrstuvwxyz']);         // ["bcdfghjklmnpqrstvwxyz"]
removeVowels(['green', 'YELLOW', 'black', 'white']);  // ["grn", "YLLW", "blck", "wht"]
removeVowels(['ABC', 'AEIOU', 'XYZ']);                // ["BC", "", "XYZ"]
