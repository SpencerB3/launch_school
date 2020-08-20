// Using the forEach method, write some code to output all vowels from the strings in the arrays.Don't use a for or while loop.

let obj = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog'],
};

Object.values(obj).forEach(arr => {
  let matches = arr.join(' ').match(/[aeiou]/gi) || false;
  if (matches) matches.forEach(char => console.log(char));
});
