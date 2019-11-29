// Modify the age.js program you wrote in the exercises for the Variables chapter.The updated code should ask the user to enter their age instead of hard - coding the age in the program.

let rlSync = require('readline-sync');
let age = Number(rlSync.question("How old are you?\n"))

console.log(`You are ${age} years old.`);
console.log(`In 10 years, you will be ${age + 10} years old.`);
console.log(`In 20 years, you will be ${age + 20} years old.`);
console.log(`In 30 years, you will be ${age + 30} years old.`);
console.log(`In 40 years, you will be ${age + 40} years old.`);
