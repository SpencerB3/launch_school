# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
  # return array if array == []
  # new_total = [array[0]]
  # array.each.with_index do |num, i|
  #   if i != array.length - 1
  #     new_total << new_total[i] + array[i + 1]
  #   end
  # end
  # new_total
end

p running_total([2, 5, 13])
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []