# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(number)
  string = ""
  number.times do |i|
    number = i % 2 == 0 ? '1' : '0'
    string << number
  end
  string

  # end
  # number.times do |i|
  #   if i.even?
  #     string += '1'
  #   else
  #     string += '0'
  #   end
  # end
  # return string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
