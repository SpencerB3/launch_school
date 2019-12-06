// Using the multiply() function from the "Multiplying Two Numbers" problem, write a function that computes the square of its argument(the square is the result of multiplying a number by itself).

const multiply = (num1, num2) => num1 * num2;

// const square = num => multiply(num, num);
const square = (num, expo) => Math.pow(num, expo);

console.log(square(5, 2) === 25); // logs true
console.log(square(-8, 2) == 64); // logs true
