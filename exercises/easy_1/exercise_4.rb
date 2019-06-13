# Write a method that counts the number of occurrences of each element in a given array.

# def count_occurrences(autos)
#   list = {}
#   autos.each do |auto|
#     if list[auto] == nil
#       list[auto] = 1
#     else
#       list[auto] += 1
#     end
#   end
#   puts list
# end

def count_occurrences(autos)
  list = {}
  autos.each do |element|
    list[element] = autos.count(element)
  end
  list.each do |k, v|
    puts "#{k} => #{v}"
  end

end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
puts count_occurrences(vehicles)