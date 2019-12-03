// The destinations array contains a list of travel destinations. Write a function that checks whether or not a particular destination is included within destinations, without using the built -in method Array.prototype.includes().


let destinations = ['Prague', 'London', 'Sydney', 'Belfast', 'Rome',
  'Aruba', 'Paris', 'Bora Bora', 'Barcelona', 'Rio de Janeiro',
  'Marrakesh', 'New York City'];

function contains(city, hot_spots) {
  for(let i = 0; i < hot_spots.length; i += 1 ) {
    if (city === hot_spots[i]) {
      return true;
    }
  }
  return false;
}

contains('Barcelona', destinations); // true
contains('Nashville', destinations); // false
