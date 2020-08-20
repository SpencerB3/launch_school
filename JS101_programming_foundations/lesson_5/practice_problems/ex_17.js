// Each UUID consists of 32 hexadecimal characters(the digits 0 - 9 and the letters a - f) represented as a string.The value is typically broken into 5 sections in an 8 - 4 - 4 - 4 - 12 pattern, e.g., 'f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91'.

// Write a function that takes no parameters and returns a UUID.

const CHARS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2',
'3', '4', '5', '6', '7', '8', '9'];

function generateUUID() {
  return `${makeSegment(8)}-${makeSegment(4)}-${makeSegment(4)}-` +
  `${makeSegment(4)}-${makeSegment(12)}`;
}

function makeSegment(size) {
  let result = '';
  let idx = 0;
  while (idx < size) {
    let randomIndex = Math.floor((Math.random() * 36));
    result += CHARS[randomIndex];
    idx += 1;
  }
  return result;
}

console.log(generateUUID());
