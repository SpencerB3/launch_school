# def each_with_index(array)
#   index = 0
#   array.each do |value|
#     yield(value, index)
#     index += 1
#   end
# end

def each_with_index(array)
  counter = 0

  while counter < array.size
    ele = array[counter]
    yield(ele, counter)
    counter += 1
  end

  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
