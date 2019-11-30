# Write a method that counts the number of occurrences of each element in a given array.

def count_occurrences(vehicles)
  autos = Hash.new(0)
  vehicles.each { |auto| autos[auto] += 1 }
  autos.each { |auto, count| puts "#{auto} => #{count}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
