// Given the following data structure, return a new array with the same structure, but with the subarrays ordered-- alphabetically or numerically as appropriate -- in ascending order.

let arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']];

let newArr = arr.map(subarr => {
  if (typeof subarr[0] === 'number') {
    return subarr.slice().sort((a, b) => a - b);
  } else {
    return subarr.slice().sort();
  }
});


console.log(newArr);
console.log(arr);