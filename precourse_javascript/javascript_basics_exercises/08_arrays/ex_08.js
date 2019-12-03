// How can you check whether a variable holds a value that is an array ? For example, imagine you start writing a function and want to check whether its argument is an array:

function filter(input) {
  return Array.isArray(input);
}

filter([1, 2, 3]); // true
