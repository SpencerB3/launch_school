// Take a moment to read the MDN documentation on the continue statement.

// Then write a for loop that loops over the elements of the array cities and logs the length of each string to the console.If the element is null, skip forward to the next iteration without logging anything to the console.

/* Entering into thje first line of the for loop, we first initialize the variable i to 0.  We then set the for loop condition so that the for loop runs as long as i is less than the length of the cities array.  We finally increment the variable i by one after every iteration.
  In the body of the for loop, we set an if statement.  In the first line we set an if clause that checks if the element of the cities array at its current index (set by the value of i) is equal to null. If it is equal, we go to the next line and find the continue statement.  The continue statement causes the for loop to immediately exit the current iteration and jump to the next iteration.  If the condition of the first if clause is false, we then drop down two lines to the else statement, which then sends us one line down where we see the current element in the array cities logged to the console.

*/

let cities = ['Istanbul', 'Los Angeles', 'Tokyo', null, 'Vienna', null, 'London', 'Beijing', null];

for (let i = 0; i < cities.length; i += 1) {
  if (cities[i] === null) {
    continue;
  } else {
    console.log(cities[i]);
  }
}
