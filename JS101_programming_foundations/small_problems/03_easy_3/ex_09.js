// Given a string that consists of some words and an assortment of non - alphabetic characters, write a function that returns that string with all of the non - alphabetic characters replaced by spaces.If one or more non - alphabetic characters occur in a row, you should only have one space in the result(i.e., the result string should never have consecutive spaces).

// i: string, o: same string, consecutive non alpha chars reduced to one space, never consecutive spaces
/* declare function
declare var of empty string
  loop through string
    if char is alpha --> send to helper functions
      add to clean text
    else 
    if last char is not a space
      add a space
    end
  end
  return clean text
end

fun isUpperCase 
  return true if value of char is between A or Z
end

fun isLowerCase
  return true if value is between a and z
end

*/

function cleanUp(text) {
  let clean_text = '';
  for( let i = 0; i < text.length; i += 1) {
    if (isLowerCase(text[i]) || isUpperCase(text[i])) {
      clean_text += text[i];
    } else if (clean_text[clean_text.length - 1] !== ' ') { // if the last character is not a space, make it a space
      clean_text += ' ';
    }
  }
  return clean_text;
}

function isUpperCase(char) {
  return (char <= 'Z' && char >= 'A');
}

function isLowerCase(char) {
  return (char <= 'z' && char >= 'a');
}

cleanUp("---what's my +*& line?");    // " what s my line "
