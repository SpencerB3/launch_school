// Write a function that takes one argument, a positive integer, and returns the sum of its digits.Do this using list processing techniques.

function sum(num) {
  let numArr = String(num).split('');
  return numArr.reduce((sum, num) => sum + Number(num), 0);
}

sum(23);           // 5
sum(496);          // 19
sum(123456789);    // 45
