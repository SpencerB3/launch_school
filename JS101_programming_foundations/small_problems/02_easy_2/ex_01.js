// Create a function that takes 2 arguments, an array and an object.The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The object will contain two keys, "title" and "occupation", and the appropriate values. Your function should return a greeting that uses the person's full name, and mentions the person's title.
/*
i: array - 2 or more elements, the object - two keys, "title" and "occupation", with appropriate values
o: string, uses above input in a string

set function greeting, parameter one is an array with the spread parameter, p 2 is object with two property/values
  set name variable to a string version of the array parameter
  set job variable to a string version of the values of the parameter object
  set string variable and assign it to template liiteral with appropriate two variables
  return string
  end

  declare function greeting w two parameters - array and obj
    set name string var
    set title string var
    set greeting string var
    return greeting string var
  end
*/

function greetings([...names], status ) {
  let fullName = [...names].join(' ');
  let jobTitle = Object.values(status).join(' ');
  return `Hello, ${fullName}! Nice to have a ${jobTitle} around.`
}

console.log(
  greetings(["John", "Q", "Doe"], { title: "Master", occupation: "Plumber" })
);
// logs Hello, John Q Doe! Nice to have a Master Plumber around.
