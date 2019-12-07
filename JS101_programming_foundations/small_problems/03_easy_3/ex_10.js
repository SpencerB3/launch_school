// Write a function that takes a year as input and returns the century.The return value should be a string that begins with the century number, and ends with 'st', 'nd', 'rd', or 'th' as appropriate for that number.

// New centuries begin in years that end with 01.So, the years 1901 - 2000 comprise the 20th century.

/*
i: number, a year : o: string, number of century plus suffix
need to take a number and turn it into a century number + give it a suffix --> use helper function
declare century fun
  let century var = year / 100 - use Math.ceil
  return string represenration of century plus a suffix
end

i: number , o: suffix
declare suffix fun
  if the year % 100 equals 11, 12, 13, return 'th
  set last digit to year % 10

  declare switch stmt with last digit
  case 1
    return st
  case 2
    return nd
  case 3
    return rd
  default 
    th
  end
end
*/

function century(year) {
  let century = Math.ceil(year / 100);
  return `${String(century)}${centurySuffix(century)}`;
}

function centurySuffix(century) {
  if ([11, 12, 13].includes(century % 100)) {
    return 'th';
  }
  let lastDigit = century % 10;

  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
