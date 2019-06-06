# def oddities(array)
#   new_array = []
#   array.each_with_index do |ele, i|
#     if i % 2 == 0
#       new_array << array[i] 
#     end
#   end
#    return new_array
# end
    
def oddities(array)

  new_array = []
  array.select do |ele|
    new_array << ele if array.index(ele).even?
  end
  new_array

end

  # new_array = []
  # index = 0
  # while index < array.size
  #   new_array.push(array[index])
  #   index += 2
  # end
  # return new_array
# end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []