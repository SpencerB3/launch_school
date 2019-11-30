// Loop over the elements of the array fish, logging each one, and terminate the loop as soon as you encounter the string 'Nemo'.

/*
We first start the for loop by initializing the variable i to 0.  We then set the for loop to run as long as the value of i is less than the length of the fish array.  We finally increment i by 1.  
  In the body of the for loop we log the element of the array fish according to the value of i which is set as the array's index.  In the second line of the body of the for loop, we have an if statement.  The if clause of the if statement tests if the element iterated over in the array fish is equal to the string Nemo.  If true, we then go to the second line of the if statement where we find a break statement.  The break statement causes us to immediately break out of the loop.
*/

let fish = ['Dory', 'Marlin', 'Gill', 'Nemo', 'Bruce'];

for (let i = 0; i < fish.length; i += 1) {
  console.log(fish[i]);
  if (fish[i] === 'Nemo') {
    break;
  }
}
