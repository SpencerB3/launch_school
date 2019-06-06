# def count_occurrences(auto)
#   hash = {}
#   auto.each do |key|
#     if hash[key] == nil
#       hash[key] = 1
#     else
#       hash[key] += 1
#     end
#   end
#   puts hash
# end

def count_occurrences(array)
  occurrences = {}

  array.each do |ele|
    if occurrences.has_key?(ele) == false
      occurrences[ele] = 1
    else 
      occurrences[ele] += 1
    end
  end
  puts occurrences
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
puts count_occurrences(vehicles)