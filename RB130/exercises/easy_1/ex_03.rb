def missing(array)
  (array[0]..array[-1]).to_a - array
end

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     puts first + 1, second - 1
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
