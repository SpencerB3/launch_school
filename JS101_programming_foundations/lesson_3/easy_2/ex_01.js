// Given a string, return a new string that replaces every occurrence of the word "important" with "urgent":

let advice = "Few things in life are as important as house training your pet dinosaur.";

let newAdvice = advice.replace(/important/g, 'urgent');
console.log(newAdvice);

// string.prototrype.replace will replace all occurences if a regular expression with `g' is used
