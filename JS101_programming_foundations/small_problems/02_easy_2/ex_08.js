// Write a function that returns an Array that contains every other element of an Array that is passed in as an argument.The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

// i: array i : new array, every other ele from original array, based on index
// declare array, for loop with +2 iteration, push elements, return new array

function oddities(array) {
  let odd_ele = [];

  for( let i = 0; i < array.length; i += 2) {
    odd_ele.push(array[i]);
  }
  return odd_ele;
}

console.log(oddities([2, 3, 4, 5, 6])); // logs [2, 4, 6]
console.log(oddities([1, 2, 3, 4, 5, 6])); // logs [1, 3, 5]
console.log(oddities(["abc", "def"])); // logs ['abc']
console.log(oddities([123])); // logs [123]
console.log(oddities([])); // logs []
