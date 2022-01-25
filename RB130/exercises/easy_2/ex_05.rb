def drop_while(array)
  array.each_with_index do |ele, idx|
    return array[idx..-1] if !yield(ele)
  end

  []
end

# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []
