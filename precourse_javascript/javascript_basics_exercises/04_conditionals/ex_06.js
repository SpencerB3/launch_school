// Take your code from the previous Check the Weather exercise and rewrite it as a switch statement.

/* 
The switch statement evaluates the variable weather, and when a case clause evaluates to true, the associated code in the case clause is executed.  If no case clauses evaluate to true, then the associated code of the default clause will be executed.  In the case of the code below, because neither case branches evaluate to true against the value of the variable weather ('snowing'), the code within the default clause is invoked, in this case logging "Let's stay inside." to the console.
*/

// let weather = 'sunny';
// let weather = 'rainy';
let weather = 'snowing';

switch (weather) {
  case 'sunny':
    console.log("It's a beautiful day!");
    break;
  case 'rainy':
    console.log("Let's stay inside.");
    break;
  default:
    console.log("Let's stay inside.");
}
