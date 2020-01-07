// Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

// function repeater(string) {
//   let doubleStr = '';
//   for (let i = 0; i < string.length; i += 1) {
//     doubleStr += string[i];
//     doubleStr += string[i];
//   }
//   console.log(doubleStr);
// }

function repeater(string) {
  return string.split('').reduce((newStr, char) => {
    newStr += (char + char);
    return newStr;
  }, '');
}

repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""
