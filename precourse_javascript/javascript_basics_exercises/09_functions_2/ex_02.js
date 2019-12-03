// Change the function greet from the previous exercise, so that it takes two arguments: a greeting with 'Hello' as default value, and a recipient with 'world' as default value.The behavior should then be as follows:

// Here we make use of a template literal as well as default parameters to change the greet function.

function greet(greeting = 'Hello', recipient = 'world') { 
  console.log(`${greeting}, ${recipient}!`);
}

greet();                                // logs: Hello, world!
greet('Salutations');                   // logs: Salutations, world!
greet('Good morning', 'Launch School'); // logs: Good morning, Launch School!
