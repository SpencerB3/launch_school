// For this exercise, your objective is to refactor the recursive fibonacci function to use memoization.

let memo = {};
function fibonacci(num) {
  if (nth <= 2) {
    return 1;
  } else if (memo[num]) {
    return memo[num];
  } else {
    memo[num] = fibonacci(num - 1) + fibonacci(num - 2);
    return memo[num];
  }
}
