// Write a function that takes an ISO 639 - 1 language code and returns a greeting in that language.You can take the examples below or add whatever languages you like.

// Inside the function greet we set a switch statement.  The switch statement evaluates the parameter lang and then attempts to match it with a case clause.  If a matching case clause is found, the associated code of the case clause is run.  If a matching case clause is not found, the code associated with the default clause is run.  

function greet(lang) {
  switch (lang) {
    case 'en': return 'Hi!';
    case 'fr': return 'Salut!';
    case 'pt': return 'Olá!';
    case 'de': return 'Hallo!';
    case 'sv': return 'Hej!';
    case 'af': return 'Haai!';
    default: return 'No Matching Language';
  }
}

greet('fr'); // 'Salut!'
