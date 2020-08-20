// Given the following data structure, sort the array so that the sub - arrays are ordered based on the sum of the odd numbers that they contain.

let arr = [[1, 6, 7], [1, 5, 3], [1, 8, 3]];

arr.sort((a, b) => {
  a = a.reduce((sum, num) => {
    if (num % 2 === 1) {
      sum += num;
    }
    return sum;
  }, 0);

  b = b.reduce((sum, num) => {
    if (num % 2 === 1) {
      sum += num;
    }
    return sum;
  }, 0);

  return a - b;
})

console.log(arr);
