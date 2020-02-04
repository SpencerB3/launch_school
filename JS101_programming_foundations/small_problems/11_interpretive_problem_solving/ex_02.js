// Write a function that displays a four - pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function.You may assume that the argument will always be an odd integer.

function diamond(length) {
  numberSequence(length).forEach(number => {
    console.log(' '.repeat((length - number) / 2) + '*'.repeat(number));
  });
}

function numberSequence(length) {
  let result = [];
  let number = 1;
  let increment = 2;

  while (number > 0) {
    result.push(number);
      if (number === length) {
        increment = -2;
      }
    number += increment;
  }
  return result;
}

diamond(1);
// logs
// *
  diamond(3);
// logs
//  *
// ***
//  *
  diamond(9);
// logs
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *
