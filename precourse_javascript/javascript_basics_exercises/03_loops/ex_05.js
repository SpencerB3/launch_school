// Using the code below as a starting point, write a while loop that logs the elements of array at each index, and terminates after logging the last element of the array.

/*
First we set the conditional statement for the while loop to run as long as the value of index is less than the length of array.  Entering into the body of the while loop, we access the array element at its current index and log it to the console.  We then increment index by one, and continue the loop until the value of index exceeds or is equal to the value of the length of the array, at which point we exit the while loop.  If the value of array were an empty array, nothing would be logged to the console since the initial condition of the while loop would never have been met.
*/

let array = [1, 2, 3, 4];
let index = 0;

while (index < array.length) {
  console.log(array[index]);
  index += 1;
}
