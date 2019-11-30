// Determine the output that the following code will log to the console.

function multiplesOfThree() {
  let divisor = 1;
  let dividend;

  for (dividend = 3; dividend <= 30; dividend += 3) {
    console.log(dividend + ' / ' + divisor + ' = 3');
    divisor += 1;
  }
}

multiplesOfThree(); // the function simply needed parentheses

/*
3 / 1 = 3
6 / 2 = 3
9 / 3 = 3
12 / 4 = 3
15 / 5 = 3
18 / 6 = 3
21 / 7 = 3
24 / 8 = 3
27 / 9 = 3
30 / 10 = 3
*/
