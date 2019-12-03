// Given the below object jane, write code that retrieves the country in which Jane is located.

let jane = {
  firstName: 'Jane',
  lastName: 'Harrelson',
  age: 32,
  location: {
    country: 'Denmark',
    city: 'Aarhus'
  },
  occupation: 'engineer',
}

jane.location.country; // Denmark
