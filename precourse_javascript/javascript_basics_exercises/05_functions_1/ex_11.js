// Building on your solutions from the previous exercises, write a function localGreet that takes a locale as input, and returns a greeting.The locale allows us to greet people from different countries differently also when they share the language, for example:

function localGreet(locale) {
  let localLanguage = extractLanguage(locale);
  let localRegion = extractRegion(locale);
  switch (localRegion) {
    case 'US': return 'Hey!';
    case 'GB': return 'Hello!';
    case 'AU': return 'Howdy!';
    default: return greet(localLanguage);
  }
}

function extractLanguage(locale) {
  return locale.slice(0, 2);
}

function extractRegion(locale) {
  return locale.slice(3, 5);
}

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

localGreet('en_US.UTF-8'); // 'Hey!'
localGreet('en_GB.UTF-8'); // 'Hello!'
localGreet('en_AU.UTF-8'); // 'Howdy!'
localGreet('fr_FR.UTF-8'); // 'Salut!'
localGreet('fr_CA.UTF-8'); // 'Salut!'
localGreet('fr_MA.UTF-8'); // 'Salut!'
