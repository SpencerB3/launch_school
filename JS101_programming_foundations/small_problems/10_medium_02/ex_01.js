// Write a function that takes a string, and returns an object containing the following three properties:

// the percentage of characters in the string that are lowercase letters
// the percentage of characters that are uppercase letters
// the percentage of characters that are neither
// You may assume that the string will always contain at least one character.

function findPercentages(regex, string) {
  let matchingChars = (string.match(regex) || []).length;
  return (((matchingChars / string.length) * 100).toFixed(2));
}

function letterPercentages(string) {
  return {
    lowercase: findPercentages(/[a-z]/g, string),
    uppercase: findPercentages(/[A-Z]/g, string),
    neither: findPercentages(/[^a-z]/gi, string)
  };
}

letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
