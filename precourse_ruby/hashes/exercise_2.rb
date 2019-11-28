weather = {temperature: 65, clouds: 'scattered', raining: 'no'}
time = {month: 'May', day: '30th', hour: '1:05pm'}

puts weather.merge(time) # weather is not modified
puts weather
puts time

puts weather.merge!(time) # weather is modified
puts weather
puts time
