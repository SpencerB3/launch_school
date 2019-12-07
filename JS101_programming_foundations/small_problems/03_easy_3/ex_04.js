// Write a function that calculates and returns the index of the first Fibonacci number that has the number of digits specified by the argument. (The first Fibonacci number has an index of 1.)

// You may assume that the argument is always an integer greater than or equal to 2.

/*
i: number, number of digits   o: number, number of iterations ---> how many iteartion of fibo to get to # of indices
declare function
  set index var to 2
  set first var to 1
  set second var to 1
  set fibonacci

  do/while loop: 
    set fibonacci to first plus second
    set iteration to plus 1
    set first to second
    second to fibonacci
    
  end   while fibonacci digits length is less than digits

  return index
*/

function findFibonacciIndexByLength(digits) {
  let index = 2;
  let first = 1;
  let second = 1;
  let fibonacci;

  do {
    let fibonacci = first + second;
    index += 1;
    first = second;
    second = fibonacci;
  } while (String(fibonacci).length < digits);

  return index;
}
  
findFibonacciIndexByLength(2);       // 7
findFibonacciIndexByLength(10);      // 45
findFibonacciIndexByLength(16);      // 74
