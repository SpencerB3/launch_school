// Determine whether the following object of people and their age contains an entry for 'Spot':

let ages = { Herman: 32, Lily: 30, Grandpa: 402, Eddie: 10 };

console.log(Object.keys(ages).includes('Spot'));
console.log(ages.hasOwnProperty('Spot'));
