// Write a function that computes the sum of all numbers between 1 and some other number, inclusive, that are multiples of 3 or 5. For instance, if the supplied number is 20, the result should be 98(3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

// You may assume that the number passed in is an integer greater than 1.

let multisum = function (num) {
  let numbers = [...Array(num + 1).keys()];
  let filtersNums = numbers.filter( num => num % 5 === 0 || num % 3 === 0);
  return filtersNums.reduce((sum, cur) => sum + cur);
}

multisum(3);       // 3
multisum(5);       // 8
multisum(10);      // 33
multisum(1000);    // 234168
