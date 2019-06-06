def sum(number)
  result = 0
  new_number = number.to_s.chars
  new_number.each {|num| result += num.to_i}
  return result
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45