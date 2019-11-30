# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze

def integer_to_string(number)
  string = ''
  loop do
    number, remainder = number.divmod(10)
    string.prepend(DIGITS[remainder])
    break if number.zero?
  end
  string
end

def signed_integer_to_string(number)
  result = integer_to_string(number.abs)
  return '+' + result if number.positive?
  return '-' + result if number.negative?
  result if number.zero?
  # case number <=> 0
  # when -1 then "-#{integer_to_string(-number)}"
  # when +1 then "+#{integer_to_string(number)}"
  # else         integer_to_string(number).to_s
  # end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
