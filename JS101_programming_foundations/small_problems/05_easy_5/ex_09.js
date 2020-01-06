// Write a function that counts the number of occurrences of each element in a given array.Once counted, log each element alongside the number of occurrences.Consider the words case sensitive e.g. ("suv" !== "SUV").

//   Example:

// console output -- your output sequence may be different
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2

let vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'];

function countOccurrences(items) {
  let count = items.reduce((hash, ele) => {
    hash[ele] = hash[ele] || 0;
    hash[ele] += 1;
    return hash;
  }, {});
  logOccurrences(count);
}

function logOccurrences(hash) {
  for (let ele in hash) {
    console.log(`${ele} => ${hash[ele]}`);
  }
}

countOccurrences(vehicles);
