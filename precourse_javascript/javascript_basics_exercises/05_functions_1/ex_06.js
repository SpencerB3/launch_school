// Write a function that compares the length of two strings.It should return -1 if the first string is shorter, 1 if the second string is shorter, and 0 if they're of equal length, as in the following example:

// In the function compareByLength, we use an if statement that compares the lengths of the two string parameters and returns the associated code of the condition clause which returns to true.

function compareByLength(string1, string2) {
  if (string1.length < string2.length) {
    return -1;
  } else if (string2.length > string1.length) {
    return 1;
  } else {
    return 0;
  }
}

compareByLength('patience', 'perseverance'); // 1
compareByLength('strength', 'dignity');      // -1
compareByLength('humor', 'grace');           // 0
