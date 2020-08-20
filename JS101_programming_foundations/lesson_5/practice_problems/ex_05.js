// Compute and display the total age of the male members of the family.

let munsters = {
  Herman: { age: 32, gender: 'male' },
  Lily: { age: 30, gender: 'female' },
  Grandpa: { age: 402, gender: 'male' },
  Eddie: { age: 10, gender: 'male' },
  Marilyn: { age: 23, gender: 'female' }
};

// let sum = 0;

// for (let key in munsters) {
//   if (munsters[key]['gender'] === 'male') {
//     sum += munsters[key]['age'];
//   }
// }

// console.log(sum);


let sum = Object.values(munsters).reduce((sum, info) => {
  if (info['gender'] === 'male') {
    sum += info['age'];
  }
  return sum;
}, 0)

console.log(sum);
