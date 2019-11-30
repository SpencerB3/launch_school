// Write a while loop that logs all odd natural numbers between 1 and 40.

/* Entering into the first line of the for loop, we first initalize the variable i to the value 0.  We then set the conditional statement so that the for loop will run as long as the value of i is less than or equal to the value of 40.  We then increment the value of i once after every iteration.
  In the body of the for loop, we set an if statement.  In the first line of the if statement, we have an if clause that uses the equality operator to test the equality between i % 2 and 1.  If the result of the equality operator is true, we then go down to the next line where i is an argument for console.log and is thus logged to the console.
*/

for (let i = 1; i <= 40; i += 1) {
  if (i % 2 === 1) {
    console.log(i); 
  }
}
