// Write a function that implements the Caesar Cipher.The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely.It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet.For example, if the letter 'A' is right - shifted by 3 positions, it will be substituted with the letter 'D'.This shift value is often referred to as the key.The "encrypted plaintext"(the ciphertext) can be decoded using this key value.

// The Caesar Cipher only encrypts letters(including both lower and upper case).Any other character is left as is.The substituted letters are in the same letter case as the original letter.If the key value for shifting exceeds the length of the alphabet, it wraps around from the beginning.

const lowerCaseAlpha = "abcdefghijklmnopqrstuvwxyz";
const upperCaseAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

function caesarEncrypt(plaintext, key) {
  let ciphertext = '';

  for (let idx = 0; idx < plaintext.length; idx += 1) {
    if (lowerCaseAlpha.includes(plaintext[idx].toLowerCase())) {
      ciphertext += encryptChar(plaintext[idx], key);
    } else {
      ciphertext += plaintext[idx];
    }
  }
  console.log(ciphertext);
}

function encryptChar(char, key) {
  if (char === char.toUpperCase()) {
    let index = upperCaseAlpha.indexOf(char);
    index = (index + key) % 26;
    return upperCaseAlpha[index];
  } else {
    let index = lowerCaseAlpha.indexOf(char);
    index = (index + key) % 26;
    return lowerCaseAlpha[index];
  }
}

// simple shift
caesarEncrypt('A', 0);       // "A"
caesarEncrypt('A', 3);       // "D"

// wrap around
caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"