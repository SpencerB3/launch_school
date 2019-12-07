// Write a function that will take a short line of text, and write it to the console log within a box.
const log = (message) => console.log(`${message}`);

function logInBox(message) {
  let horizonalLine = (`+-${'-'.repeat(message.length)}-+`);
  let emptyLine = (`| ${' '.repeat(message.length)} |`);

  log(horizonalLine);
  log(emptyLine);
  log(`| ${message} |`);
  log(emptyLine);
  log(horizonalLine);
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
