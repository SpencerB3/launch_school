// Write a function that will take a short line of text, and write it to the console log within a box.
const log = (message) => console.log(`${message}`);

function logInBox(message) {
  let horizonal_line = (`+-${'-'.repeat(string.length)}-+`);
  let empty_line = (`| ${' '.repeat(string.length)} |`);

  log(horizonal_line);
  log(empty_line);
  log(`| ${message} |`);
  log(empty_line);
  log(horizonal_line);
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
