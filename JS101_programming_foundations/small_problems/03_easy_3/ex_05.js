// Write a function that takes a positive integer, n, as an argument, and logs a right triangle whose sides each have n stars.The hypotenuse of the triangle(the diagonal side in the images below) should have one end at the lower - left of the triangle, and the other end at the upper - right.

/*
i: number, o: nil, spaces and star to the console printed number times
==> make triangle, first line = (num - 1) spaces + one star, last has num stars

variables: 
set spaces to spaces repated num - 1 times
set stars to 1

action:
loop 
  print out spaces + stars on one line
  subtract from space variable
  add to stars variable
  break when stars equals number
end

return: no return
*/

function triangle(num) {
  let spaces = num - 1;
  let stars = 1;
  while (stars <= num) {
    console.log(`${' '.repeat(spaces)}${'*'.repeat(stars)}`)
    spaces -= 1;
    stars += 1;
  }
}

triangle(5);

//     *
//    **
//   ***
//  ****
// *****

  triangle(9);

//         *
//        **
//       ***
//      ****
//     *****
//    ******
//   *******
//  ********
