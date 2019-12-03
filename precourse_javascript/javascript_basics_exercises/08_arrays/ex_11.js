// Write code that removes the items from 'groceryList' one by one, until it is empty.If you log the elements you remove, the expected behavior would look as follows.

// We set a while statement to the condition that it will run as long as the length of the array groceryList is greater than 0.  We then enter into the body of the while loop and initialize the variable item and assign it to the return value of the shift method called on the grocerList array. In the next line we log the variable item to the console.  This loop will continue to assign item to the 'popped' first element in the array until the array is empty at which point we exit the loop.

let groceryList = ['paprika', 'tofu', 'garlic', 'quinoa', 'carrots', 'broccoli', 'hummus'];

while (groceryList.length > 0) {
  let item = groceryList.shift()
  console.log(item)
}

groceryList;
