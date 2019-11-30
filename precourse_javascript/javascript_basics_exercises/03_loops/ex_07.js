// The following code keeps looping forever. (You can hit Ctrl - C to stop it.) Why is that ? Also modify it so that it stops after the first iteration.

// The for loop keeps looping forever since no conditional statement was set which could at some point return false and allow us to exit the loop.  Below I've set the conditional statement so that the for loop will run as long as i is less than 5.

// let i;

// for (i = 0; ; i += 1) {
//   console.log("and on");
// }

let i;

for (i = 0; i < 5; i += 1) {
  console.log("and on");
}