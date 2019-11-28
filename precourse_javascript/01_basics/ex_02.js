// Use the arithmetic operators to determine the individual digits of a 4 - digit number like 4936:

// thousands place is 4
// hundreds place is 9
// tens place is 3
// ones place is 6

let number = 4936

let ones = number % 10
console.log(ones)

number = (number - ones) / 10
let tens = number % 10
console.log(tens)

number = (number - tens) / 10
let hundreds = number % 10
console.log(hundreds)

number = (number - hundreds) / 10
let thousands = number % 10
console.log(thousands)
