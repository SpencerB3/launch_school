// Given the following data structure, write some code that returns an object where the key is the first item in each subarray, and the value is the second.

let arr = [['a', 1], ['b', 'two'], ['sea', { 'c': 3 }], ['D', ['a', 'b', 'c']]];

let result = arr.reduce((obj, subarr) => {
  let [key, value] = subarr;
  obj[key] = value;
  return obj;
}, {});

console.log(result);

// expected return value of function call
// { a: 1, b: 'two', sea: { c: 3 }, D: [ 'a', 'b', 'c' ] }