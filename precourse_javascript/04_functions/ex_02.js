// In the exercises for the previous chapter, you wrote a dynamic greeter program named greeter.js.Add a function to this program that solicits the user's first and last names in separate invocations; the function should return the appropriate name as a string. Use the return values to greet the user with their full name.

// let rlSync = require('readline-sync');
// let firstName = rlSync.question("What is your first name?\n");
// let lastName = rlSync.question("What is your last name?\n");

let rlSync = require('readline-sync');


function getName(prompt) {
  
  name = rlSync.question(prompt);
  return name;
}

firstName = getName('What is your first name?\n')
lastName = getName('What is your last name?\n')

console.log(`Good Morning, ${firstName} ${lastName}!`);

// console.log(`Hello, ${firstName} ${lastName}!`);
