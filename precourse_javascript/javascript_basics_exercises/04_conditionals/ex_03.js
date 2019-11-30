// Take your code from the previous exercise and rewrite the conditional so that it uses the ternary if-then -else operator.

/*  In this code, in the conditional statement of the ternary operator, we test if the variable randomNumber is truthy or not.  If so, we jump to the first expression and return the string "Yes".  If false, we jump to the far expression and return the string 'No'.  The resturn value is then logged to the console.
*/

let randomNumber = Math.round(Math.random());

console.log(randomNumber ? 'Yes!' : 'No.');
