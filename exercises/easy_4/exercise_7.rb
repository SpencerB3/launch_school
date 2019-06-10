# def string_to_integer(string)
#   puts Integer(string)
#   Integer(string)
# end
 DIGITS = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 
  }

def string_to_integer(string)

  digits = string.each_char.map {|char| DIGITS[char]}

  value = 0

  digits.each {|digit| value = 10 * value + digit}
  puts value
  value
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570