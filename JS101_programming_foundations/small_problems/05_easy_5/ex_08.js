// Write a function that takes one argument, a positive integer, and returns a list of the digits in the number.

//map
function digitList(digit) {
  return String(digit).split('').map ((num) => {
    return Number(num);
  });
}

// function digitList(digit) {
//   let numbers = [];
//   while (digit > 0) {
//     let remainder = digit % 10;
//     numbers.unshift(remainder);
//     digit = Math.floor(digit / 10);
//   }
//   console.log(numbers);
// }

digitList(12345);       // [1, 2, 3, 4, 5]
digitList(7);           // [7]
digitList(375290);      // [3, 7, 5, 2, 9, 0]
digitList(444);         // [4, 4, 4]
