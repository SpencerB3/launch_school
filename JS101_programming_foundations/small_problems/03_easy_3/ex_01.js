// Write a function that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

/*
i: string, o: new_string, => strip out consecutive chars and put remaining chars in new string
declare empty string
loop through original string
  if character does not equal the next chacter
    add to empty string
  end
end
return new_string
*/

function crunch(string) {
  let result = '';
  for(let i = 0; i < string.length; i += 1) {
    if (string[i] !== string[i + 1]) {
      result += string[i];
    }
  }
  console.log(result);
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""
