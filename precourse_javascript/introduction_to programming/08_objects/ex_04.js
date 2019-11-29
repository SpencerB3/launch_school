// Create an array from the keys of object obj below, with all values converted to uppercase.Your implementation must not mutate obj.  The order of the array does not matter.

let obj = {
  b: 2,
  a: 1,
  c: 3,
};

let newValues = [];

for (let prop in obj) {
  if (obj.hasOwnProperty(prop)) {
    newValues.push(prop.toUpperCase())
  }
}

// let newValues = Object.keys(obj).map( key => key.toUpperCase());

console.log(newValues);
