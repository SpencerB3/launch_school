// A featured number(something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occuring exactly once each.For example, 49 is a featured number, but 98 is not(it is not odd), 97 is not(it is not a multiple of 7), and 133 is not(the digit 3 appears twice).

// Write a function that takes an integer as an argument, and returns the next featured number greater than the integer.Issue an error message if there is no next featured number.

// NOTE: The largest possible featured number is 9876543201.

function featured(num) {
  const MAX_NUMBER = 9876543201;
  let featuredNum = toOddMultipleOf7(num);

  do {
    if (allUnique(featuredNum)) {
      return featuredNum;
    }
    featuredNum += 14;
  } while (featuredNum < MAX_NUMBER);
  return "There is no possible number that fulfills those requirements.";
}

function toOddMultipleOf7(num) {
  do {
    num += 1;
  } while (num % 2 === 0 || num % 7 !== 0);

  return num;
}

function allUnique(num) {
  let digits = String(num).split('');
  let seen = {};

  for (let idx = 0; idx < digits.length; idx += 1) {
    if (seen[digits[idx]]) {
      return false;
    }
    seen[digits[idx]] = true;
  }
  return true;
}

featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."
