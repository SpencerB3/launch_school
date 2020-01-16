// The Array.prototype.reverse method reverses the order of elements in an array, and Array.prototype.sort can rearrange the elements in a variety of ways, including descending.Both of these methods mutate the original array as shown below.Write two distinct ways of reversing the array without mutating the original array.Use reverse for the first solution, and sort for the second.

let numbers = [1, 2, 3, 4, 5];

let result = numbers.slice().reverse();

let secondResult = numbers.slice().sort((a, b) => b - a);

console.log(result);
console.log(secondResult);

let thirdResult = [];

numbers.forEach (num => thirdResult.unshift(num));
console.log(thirdResult);

let fourthResult = numbers.reduce((arr, num) => {
  arr.unshift(num);
  return arr;
}, []);

console.log(fourthResult);

console.log(numbers);
