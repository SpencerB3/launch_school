# def none?(array)
#   array.each do |ele|
#     return false if yield(ele)
#   end

#   true
# end

def none?(collection, &block)

  !any?(collection, block)
end

def any?(array, block)
  raise NoMethodError unless array.kind_of?(Array)

  array.each do |ele|
    return true if block.call(ele)
  end

  false
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true
