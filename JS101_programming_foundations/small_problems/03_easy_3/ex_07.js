// A double number is an even - length number whose left - side digits are exactly the same as its right - side digits.For example, 44, 3333, 103103, and 7676 are all double numbers, whereas 444, 334433, and 107 are not.

// Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number; return double numbers as- is.

/*
i: number, o: number  --> check to see if input is double number, if so, return as is : if not, double the number
  helper function to check if number is double number
  
declare twice function
  if passing number to helper function returns true , return number : return double number
end

declare isDoubleNumber function
  set string number to String method on number
  set middle = length of string number / 2 
  set first half
  set second half
  if statement string number's length is odd
    return false
  else if string number first half === string number seond half
    return true
  else
    return false
  end
*/

function twice(number) {
  return isDoubleNumber(number) ? number : number * 2;
}

function isDoubleNumber(number) {
  let numberStr = String(number);
  let middle = Math.floor(numberStr.length / 2);
  let firstHalf = numberStr.slice(0, middle);
  let secondHalf = numberStr.slice(middle);
  
  return firstHalf === secondHalf;
}

twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676
