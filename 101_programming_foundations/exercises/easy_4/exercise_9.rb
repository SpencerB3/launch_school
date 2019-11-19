# Write a method that takes a positive integer or zero, and converts it to a string representation.

DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number.zero?
  end
  result
end

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
