// Now we are going to outsource the greeting and recipient to methods.Change the function greet from the previous exercise, so that it doesn't take any arguments, and instead calls the functions greeting and recipient defined below.

function greeting() {
  return 'Good morning';
}

function recipient() {
  return 'Launch School';
}

function greet() {
  console.log(`${greeting()}, ${recipient()}!`);
}

greet();
