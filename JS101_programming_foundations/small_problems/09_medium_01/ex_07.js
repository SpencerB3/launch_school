// Rewrite your recursive fibonacci function so that it computes its results without using recursion.

function fibonacci(num) {
  let previousTwo = [1, 1]
  for (let idx = 3; idx <= num; idx += 1) {
    previousTwo = [previousTwo[1], previousTwo[0] + previousTwo[1]];
  }
  console.log(previousTwo[1]);
}

fibonacci(20);       // 6765
fibonacci(50);       // 12586269025
fibonacci(75);       // 2111485077978050
