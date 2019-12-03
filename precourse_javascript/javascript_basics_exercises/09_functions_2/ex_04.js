// How can we refactor the function definition below(without changing the function invocation) so that we don't need to use the arguments object?

function sum(...values) { // rest parameter syntax
  values = Array.prototype.slice.call(arguments);

  return values.reduce(function (a, b) {
    return a + b;
  });
}

sum(1, 4, 5, 6); // 16
