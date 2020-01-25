// Write a function that takes a grocery list(a two - dimensional array) with each element containing a fruit and a quantity, and returns a one - dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.

function buyFruit(array) {
  let result = [];
  array.forEach( subArray => {
    for (let idx = subArray[1]; idx > 0; idx -= 1) {
      result.push(subArray[0]);
    }
  });
  return result;
}

buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]);
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
