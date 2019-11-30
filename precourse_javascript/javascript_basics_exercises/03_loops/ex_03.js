// Write a loop that logs greeting three times.

/*
First we declare the variable i and set it to the value of 0.  Then we begin a while loop by first setting the condition for the while loop to run as long as i is greater than 0.  Entering into the block of the while loop, we log the value of the variable greeting to the consol, and then in the last line, the variable i is incremented by 1.  The value of the variable greeting is logged three times to the console before the while loop conditional statement is met and we exit the while loop.
*/

let greeting = 'Aloha!';

let i = 0;

while (i < 3) {
  console.log(greeting);
  i += 1;
}
