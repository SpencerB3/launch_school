// Write a function that determines the mean(average) of the three scores passed to it, and returns the letter associated with that grade.

// Numerical score letter grade list:

// 90 <= score <= 100: 'A'
// 80 <= score < 90: 'B'
// 70 <= score < 80: 'C'
// 60 <= score < 70: 'D'
// 0 <= score < 60: 'F'
// Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

/*
i: three grades, o: string grade --> get average of three grades, pass average to obj or function to get grade
set grades as an obj or function

set getgrades function
  set average var as all three grades added together divided by three
  pass average to function, or iterate it throufg the object to get grade
  return grade
*/

function grades(score) {
  if (score <= 100 && score >= 90) {
    return 'A';
  } else if (score < 90 && score >= 80) {
    return 'B';
  } else if (score < 80 && score >= 70) {
    return 'C';
  } else if (score < 70 && score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

function getGrade(s1, s2, s3) {
  let average = (s1 + s2 + s3) / 3;
  return grades(average);
}

getGrade(95, 90, 93);    // "A"
getGrade(50, 50, 95);    // "D"
