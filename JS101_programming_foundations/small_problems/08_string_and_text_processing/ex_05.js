// Write a function that takes a string as an argument, and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase.Leave all other characters unchanged.

function swapCase(string) {
  console.log(string
    .split('')
    .reduce((newStr, char) => {
      /[A-Z]/.test(char) ? newStr += char.toLowerCase() :
                           newStr += char.toUpperCase();
      return newStr;
  }, ""));
}

swapCase('CamelCase');              // "cAMELcASE"
swapCase('Tonight on XYZ-TV');      // "tONIGHT ON xyz-tv"
