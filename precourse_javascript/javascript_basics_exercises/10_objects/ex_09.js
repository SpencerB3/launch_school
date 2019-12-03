// Write code that does the reverse, starting from a nested array of pairs and building an object.

// Here we iterate over the array, setting the object person's key to the first element of the nested array, and setting the value to the second element in the nested array.

let nestedArray = [['title', 'Duke'], ['name', 'Nukem'], ['age', 33]];

let person = {}

for(let i = 0; i < nestedArray.length; i += 1) {
  let pair = nestedArray[i];
  person[pair[0]] = pair[1];
}

console.log(person); // { title: 'Duke', name: 'Nukem', age: 33 }
