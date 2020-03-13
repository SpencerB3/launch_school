// Write a function that takes the three angles of a triangle as arguments, and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

// You may assume that all angles have integer values, so you do not have to worry about floating point errors.You may also assume that the arguments are in degrees.

function isValid(...degrees) {
  if (degrees.some(angle => angle === 0)) return false;
  if (degrees.reduce((acc, num) => acc + num) !== 180) {
    return false;
  }
  return true;
}

function triangle(...degrees) {
  if (!isValid(...degrees)) return 'invalid';

  if (degrees.some(degree => degree === 90)) {
    return 'right';
  } else if (degrees.every(degree => degree < 90)) {
    return 'acute';
  } else if (degrees.some(degree => degree > 90)) {
    return 'obtuse';
  }
}

triangle(60, 70, 50);       // "acute"
triangle(30, 90, 60);       // "right"
triangle(120, 50, 10);      // "obtuse"
triangle(0, 90, 90);        // "invalid"
triangle(50, 50, 50);       // "invalid"
