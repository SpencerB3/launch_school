def max_by(array)
  return nil if array.empty?

  max_num = array.first
  array.each do |num|
    max_num = num if yield(num) > yield(max_num)
  end

  max_num
end

# def max_by(array)
#   return nil if array.empty?

#   max_num = array.first
#   largest = yield(max_num)

#   array[1..-1].each do |num|
#     if yield(num) > largest
#       largest = yield(num)
#       max_num = num
#     end
#   end

#   max_num
# end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil
