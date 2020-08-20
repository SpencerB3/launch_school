// Perform the same transformation of sorting the subarrays we did in the previous exercise with one difference; sort the elements in descending order.

let arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']];

let newArr = arr.map(subarr => {
  if (typeof subarr[0] === 'string') {
    return subarr.slice().sort().reverse()
  } else {
    return subarr.slice().sort((a, b) => b - a);
  }
});

console.log(newArr);
console.log(arr);
