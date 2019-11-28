// Log all of the even values from myArray to the console.

let myArray = [1, 3, 6, 11, 4, 2,
  4, 9, 17, 16, 0];

myArray.forEach(function(num) {
  if (num % 2 === 1) {
    console.log(num); 
  }
});
