// Write a function that takes one argument, a positive integer, and returns a string of alternating '1's and '0's, always starting with a '1'.The length of the string should match the given integer.

/* i: number, o: string --> length equal to number, begin with '1'
declare empty string, 
for loop, 
  if i is even, add '1' to string
  else add '0'
end
return empty string
*/

function stringy(number) {
  let result = '';
  for(let i = 0; i < number; i += 1) {
    i % 2 === 0 ? result += '1' : result += '0'
  }
  return result;
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"
