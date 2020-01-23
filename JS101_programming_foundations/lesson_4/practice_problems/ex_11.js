// Create an object that expresses the frequency with which each letter occurs in this string:

let statement = "The Flintstones Rock";
// The output will look something like the following:

// { T: 1, h: 1, e: 2, F: 1, l: 1, ... }

let letterCount = {};

statement.split(' ').forEach((word) => {
  word.split('').forEach((char) => {
    letterCount[char] ? letterCount[char] += 1 : letterCount[char] = 1;
  })
})

console.log(letterCount);
