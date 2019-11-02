# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(number)
  # num.to_s.split('').each { |num| sum += num.to_i }

  number.digits.sum
end

puts sum(23)

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
