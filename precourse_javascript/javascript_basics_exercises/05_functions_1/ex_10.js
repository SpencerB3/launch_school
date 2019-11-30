// Similar to the previous exercise, now write a function that extracts the region code from a locale.For example:

// // In the function extractRegion, we return the return value of the slice method called upon the parameter locale. In this case, the slice method extracts the section of locale at indices number 3 and 4.

function extractRegion(locale) {
  return locale.slice(3, 5);
}

extractRegion('en_US.UTF-8');  // 'US'
extractRegion('en_GB.UTF-8');  // 'GB'
extractRegion('ko_KR.UTF-16'); // 'KR'
