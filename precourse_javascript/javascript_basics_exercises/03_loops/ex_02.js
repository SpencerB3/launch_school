// The code below logs the numbers from 1 to 10. Change it, so that it instead logs the numbers from 10 to 1 in decreasing order, and then logs 'Launch!'.

/*
The for loop first assigns the variable i to the value of 10.  Then sets the condition that the for loop will run as long as the variable i is less than or equal to 1.  Finally the variable i is decremented by 1.  When i reaches the value of 1, `Launch!` is printed to the console.
*/

let i;

for (i = 10; i >= 1; i -= 1) {
  console.log(i);
  if (i === 1) {
    console.log('Launch!');
  }
}
