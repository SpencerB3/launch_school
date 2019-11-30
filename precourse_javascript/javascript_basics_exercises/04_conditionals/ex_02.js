// The code provided below will randomly initialize randomNumber to either 0 or 1 each time it is executed.

// Write an if statement that logs 'Yes!' if randomNumber is 1, and 'No.' if randomNumber is 0.

/* We first initialize the variable randonNumber and then assign it to the result of two chained methods.  The first method, Math.random returns a float between 0 (inclusive) to 1 (exclusive).  The method Math.round then takes the return value of Math.random and returns the number 1 if the result of Math.random is greater than .49, or 0 if the result is less than or equal to .49.
 Two lines down we have an if statement.  In the starting if clause, the truthiness of the value of randomNumber is tested.  If it evaluates to true, we then pass one line down and log 'Yes!'.  If the value of randomNumber is falsy, i.e. equals 0, then we skip to the else clause, and then down one line to finally log 'No.' to the console.
*/

let randomNumber = Math.round(Math.random());

if (randomNumber) {
  console.log('Yes!');
} else {
  console.log('No.')
}
