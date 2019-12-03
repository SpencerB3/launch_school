// How can we alter the function definition of greet so that the parameter greeting is assigned a default value of 'Hello' when no argument is passed to the method invocation ?

function greet(greeting = 'Hello') { // default parameters
  console.log(greeting + ', world!');
}

greet('Salutations'); // logs: Salutations, world!

greet(); // Hello, world!

greeting(undefined); // Uncaught ReferenceError: greeting is not defined
