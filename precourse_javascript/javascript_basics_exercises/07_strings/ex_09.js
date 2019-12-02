// Write code that capitalizes the words in the string 'launch school tech & talk', so that you get the string 'Launch School Tech & Talk'.

/* We first use string.split(' ') to separate the sentence into individual words (each ' ' breaks at the end of an element), each word being an element in a new array.  We then call the map method on this new array.  The map medthod transforms each element, capitalizing the first index and then concatenating it to the rest of the word element, and finally returns all of these transformed elements as a new array.  We then leverage the join method to transform the new array into a new string, all elements separed by a space ' '.  THis new string is finally assigned to the variable capWords.
*/
let string = 'launch school tech & talk';

let capWords = string
               .split(' ')
               .map(word => word[0].toUpperCase() + word.slice(1))
               .join(' ');
