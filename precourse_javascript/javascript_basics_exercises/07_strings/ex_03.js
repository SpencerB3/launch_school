// Implement a function repeat that repeats an input string a given number of times, as shown in the example below; without using the pre - defined string method String.prototype.repeat().

function repeat(num, string) {
  let repetitions = '';

  while (num > 0) {
    repetitions += string;
    num -= 1;
  }
  return repetitions;
}

repeat(3, 'ha'); // 'hahaha'
