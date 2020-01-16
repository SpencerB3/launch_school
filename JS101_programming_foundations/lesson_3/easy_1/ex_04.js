// Using the following string, create a new string that contains all lowercase letters except for the first character, which should be capitalized. (See the example output.)

let munstersDescription = "the Munsters are CREEPY and Spooky.";
let result = munstersDescription[0].toUpperCase()
             + munstersDescription.slice(1).toLowerCase();
console.log(result)
// => The munsters are creepy and spooky.
