// Write a function that takes the three angles of a triangle as arguments, and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

// You may assume that all angles have integer values, so you do not have to worry about floating point errors.You may also assume that the arguments are in degrees.

function isValid(arr) {
  if (arr.some(angle => angle === 0)) return false;
  if (arr.reduce((acc, num) => acc + num) !== 180) {
    return false;
  }
  return true;
}

function triangle(...degrees) {
  degrees = degrees.sort((a, b) => a - b);
  if (!isValid(degrees)) return 'invalid';

  if (degrees.some(degree => degree === 90)) {
    return 'right';
  } else if (degrees.every(degree => degree < 90)) {
    return 'acute';
  } else if (degrees.some(degree => degree > 90)) {
    return 'obtuse';
  }
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"
