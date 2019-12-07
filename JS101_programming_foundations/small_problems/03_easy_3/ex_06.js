// Create a simple madlib program that prompts for a noun, a verb, an adverb, and an adjective, and injects them into a story that you create.

let rlSync = require('readline-sync');
let log = (message) => console.log(`${message}`);

log('Enter a noun:')
let noun = rlSync.prompt();

log('Enter a verb:')
let verb = rlSync.prompt();

log('Enter an adjective:');
let adjective = rlSync.prompt();

log('Enter an adverb:')
let adverb = rlSync.prompt();

let sentence1 = `Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`;
let sentence2 = `The ${adjective} ${noun} ${verb}s ${adverb} over the lazy dog.`;
let sentence3 = `The ${noun} ${adverb} ${verb}s up ${adjective} Joe's turtle.`;

console.log(sentence1);
console.log(sentence2);
console.log(sentence3);
