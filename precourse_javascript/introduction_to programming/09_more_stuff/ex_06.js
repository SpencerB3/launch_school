// Write a function that searches an array of strings for every element that matches the regular expression given by its argument.The function should return all matching elements in an array.

let words = [
  'laboratory',
  'experiment',
  'flab',
  'Pans Labyrinth',
  'elaborate',
  'polar bear',
];

function logMatch(array, ele) {
  array.forEach( word => {
    if (ele.test(word)) {
      console.log(word);
    }
  });
}

logMatch(words, /lab/);

// Output
// 'laboratory'
// 'flab'
// 'elaborate'
