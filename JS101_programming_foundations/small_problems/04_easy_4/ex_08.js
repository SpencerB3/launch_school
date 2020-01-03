// Write a function that takes a string consisting of zero or more space separated words, and returns an object that shows the number of words of different sizes.

// Words consist of any sequence of non - space characters.

// with reduce

function wordSizes(string) {
  if (string.length === 0) return {};

  return string.split(' ').reduce((obj, word)=> {
    obj[word.length] ? obj[word.length] += 1 : obj[word.length] = 1;
    return obj;
  }, {})
}

// function wordSizes(string) {
//   let count = {};
  
//   string.split(' ').forEach((word) => {
//     if (word.length === 0) return;
//     !count[word.length] ? count[word.length] = 0 : count[word.length] += 1;
//   })
//   console.log(count);
// }

wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
wordSizes('');                                            // {}
