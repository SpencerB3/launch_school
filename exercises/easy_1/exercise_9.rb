# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(number)
  # sum = 0
  # number_array = number.to_s.split("")
  # number_sum = number_array.inject {|num, sum| sum.to_i + num.to_i}
  # number_sum
  number.digits.sum
end

puts sum(23)

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45