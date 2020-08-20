// Given the following data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables.The sizes should be uppercase, and the colors should be capitalized.

let obj = {
  grape: { type: 'fruit', colors: ['red', 'green'], size: 'small' },
  carrot: { type: 'vegetable', colors: ['orange'], size: 'medium' },
  apple: { type: 'fruit', colors: ['red', 'green'], size: 'medium' },
  apricot: { type: 'fruit', colors: ['orange'], size: 'medium' },
  marrow: { type: 'vegetable', colors: ['green'], size: 'large' },
};

let result = Object.values(obj).map(value => {
  if (value['type'] === 'fruit') {
    return value['colors'].map(word => word[0].toUpperCase() + word.slice(1));
  } else if (value['type'] === 'vegetable') {
    return value['size'].toUpperCase();
  }
});

console.log(result);