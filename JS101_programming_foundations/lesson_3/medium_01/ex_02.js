// Starting with the string:

let munstersDescription = "The Munsters are creepy and spooky.";
// Return a new string that swaps the case of all of the letters:

// => `tHE mUNSTERS ARE CREEPY AND SPOOKY.`

let result = munstersDescription.split('').reduce((result, char) => {
  char === char.toLowerCase() ? result += char.toUpperCase() 
                              : result += char.toLowerCase();
  return result;
}, "");

console.log(result);
