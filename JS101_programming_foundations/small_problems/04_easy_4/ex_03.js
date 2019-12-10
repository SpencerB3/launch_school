// Build a program that logs when the user will retire and how many more years the user has to work until retirement.

//   Example:

// What is your age ? 30 //
// At what age would you like to retire ? 70

// It's 2017. You will retire in 2057.
// You have only 40 years of work to go!

const rlSync = require('readline-sync');
const log = (message) => console.log(`=> ${message}`);

log('What is your age?');
let age = Number(rlSync.prompt());

log('At what age would you like to retire?');
let retirementAge = Number(rlSync.prompt());

let currentYear = new Date().getFullYear();

let workYearsRemaining = retirementAge - age;

let retirementYear = currentYear + workYearsRemaining;

log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
log(`You only have ${workYearsRemaining} years of work to go!`);
