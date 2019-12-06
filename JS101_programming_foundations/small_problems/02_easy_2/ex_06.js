// Write a function that returns the next to last word in the String passed to it as an argument.

// Words are any sequence of non - blank characters.

// You may assume that the input String will always contain at least two words.

//i: string, output: string, second to last word - - split string, return second to last element

function penultimate(words) {
  words = words.split(' ');
  return words.length === 1 ? words.join(' ') : words[words.length - 2]
}

console.log(penultimate("last word") === "last"); // logs true
console.log(penultimate("Launch School is great!") === "is"); // logs true
console.log(penultimate("hello") === "hello");
