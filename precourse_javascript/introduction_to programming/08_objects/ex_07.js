// Create a function that creates and returns a copy of an object.The function takes two arguments: the object to copy and an array of the keys that you want to copy.You can omit the array of keys, in which case you should copy all the keys of the object.

// Here are some examples for your reference:

function copyObj(sourceObj, keys) {
  let destinationObj = {};

  if (keys) {
    keys.forEach(function(key) {
      destinationObj[key] = sourceObj[key];
    });

    return destinationObj;
  } else {
    return Object.assign(sourceObj, destinationObj);
  }
}

let objToCopy = {
  foo: 1,
  bar: 2,
};

let newObj = copyObj(objToCopy);
console.log(newObj.foo);    // => 1
console.log(newObj.bar);    // => 2

let newObj2 = copyObj(objToCopy, ['foo']);
console.log(newObj2.foo);   // => 1
console.log(newObj2.bar);   // => undefined
