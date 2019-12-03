// Create a function removeLastChar that takes a string as argument, and returns the string without the last character.

function removeLastChar(string) {
  return string.slice(0, string.length - 1);
}

removeLastChar('ciao!'); // 'ciao'
removeLastChar('hello'); // 'hell'
