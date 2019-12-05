// Build a program that asks the user to enter the length and width of a room in meters, and then logs the area of the room to the console in both square meters and square feet.

//   Note: 1 square meter == 10.7639 square feet

let rlSync = require('readline-sync'); // load and caches the readline library as an object
const SQ_FEET_PER_SQ_METER = 10.7639;

let length = Number(rlSync.question("Enter the length of the room in meters:\n"));
let width = Number(rlSync.question("Enter the width of the room in meters:\n"));

let area_meters = (length * width).toFixed(2);

let area_feet = (area_meters * SQ_FEET_PER_SQ_METER).toFixed(2);

console.log(`The area of the room is ${area_meters} square meters(${area_feet} square feet).`);
