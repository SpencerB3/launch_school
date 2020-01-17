// The following function unnecessarily uses two return statements to return boolean values.How can you eliminate the unnecessary duplication ?

function isColorValid(color) {
  if (color === "blue" || color === "green") {
    return true;
  } else {
    return false;
  }
}

/* solution 1
function isColorValid(color) {
  return (color === "blue" || color === "green");
}
*/

/* solution 2
function isColorValid(color) {
  return (color === "blue" || color === "green") ? true : false;
}
*/

// const isColorValid = color => color === 'blue' || color === 'green';
