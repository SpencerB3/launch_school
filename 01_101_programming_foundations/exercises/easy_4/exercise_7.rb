DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}.freeze

def string_to_integer(string)
  digits = string.chars.map do |num|
    '0123456789'.index(num)
  end
  # digits = string.each_char.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = value * 10 + digit }
  value
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570
