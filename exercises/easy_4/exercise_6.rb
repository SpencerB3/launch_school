# def running_total(array)
#   return array if array == [] || array.size == 1
#   sum = 0
#   new_array = [array[0]]
#   array.each_with_index do |num, i|
#     if i != array.length - 1
#       sum += (new_array[i] + array[i + 1])
#       new_array.push(sum)
#     end
#   end
#   p new_array
#   return new_array
# end
# write another method or perhaps use reduce/inject, or simply create a new array adding sums to it

# def running_total(array)
#   sum = 0
#   array.map {|ele| sum += ele}
# end

def running_total(array)
  sum = 0
  array.each_with_object([]) do |el, ar|
    ar << el + sum
    sum += el
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
puts running_total([]) == []