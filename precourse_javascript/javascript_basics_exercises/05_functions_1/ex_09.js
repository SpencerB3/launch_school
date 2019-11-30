// Write a function that extracts the language code from a locale.A locale is a combination of a language code, a region, and usually also a character set, e.g en_US.UTF - 8.

// In the function extractLanguage, we return the return value of the slice method called upon the  parameter locale. In this case, the slice method extracts the section of locale at the first two indices.

function extractLanguage(locale) {
  return locale.slice(0, 2);
}

extractLanguage('en_US.UTF-8');  // 'en'
extractLanguage('en_GB.UTF-8');  // 'en'
extractLanguage('ko_KR.UTF-16'); // 'ko'
