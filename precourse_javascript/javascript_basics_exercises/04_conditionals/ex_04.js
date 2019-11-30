// Initialize a variable weather with a string value being "sunny", "rainy", or anything else.

// Write an if statement that logs:

// "It's a beautiful day!" if weather is assigned to the string "sunny",
// "Grab your umbrella." if weather is assigned to the string "rainy", and
// "Let's stay inside." otherwise.
// Test your code with different values for weather.

/* 
In this code, we first initialize the variable weather and assign it to a string ('snowing').  Two lines down we then set an if statement.  In the initial if branch of the if statement, we test the equality of the variable weather with the string 'sunny' using the equality operator.  If that expression evaluates to true, we then log 'It's a beautiful day!' to the console. If the expression evaluates to false, we then pass down to the else/if branch of the if statement.  Here we use the equality operator to evaluate the value of the variable weather against the string 'rainy'.  If this expression evaluates to true, we then log the string 'Grab your umbrella' to the console.  If that expression evaluates to false, we then pass down to the else branch of the if statement here.  Here we log 'Let's stay inside.' We then exit the if statement.
*/

// let weather = 'sunny';
// let weather = 'rainy';


let weather = 'snowing';

if (weather === 'sunny') {
  console.log("It's a beautiful day!");
} else if (weather === 'rainy') {
  console.log("Grab your umbrella.");
} else {
  console.log("Let's stay inside.");
}
