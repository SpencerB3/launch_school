// Write four different ways to remove all of the elements from the following array:

let numbers = [1, 2, 3, 4];

while (numbers.length !== 0) {
  numbers.pop();
}

while (numbers.length !== 0) {
  numbers.shift();
}

numbers = [];

numbers.length = 0;

numbers.splice(0, numbers.length);

while (numbers.length) {
  numbers.pop();
}
