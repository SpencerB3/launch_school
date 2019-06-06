def prompt(message)
  puts "==> #{message}"
end

puts "==> Enter the first number:"
number_1 = gets.chomp.to_i
puts "==> Enter the second number:"
number_2 = gets.chomp.to_i

prompt("#{number_1} + #{number_2} = #{number_1 + number_2}")

# addition = number_1 + number_2
# subtraction = number_1 - number_2
# multiplication = number_1 * number_2
# division = number_1 / number_2
# modulo = number_1 % number_2
# exponent = number_1 ** number_2

# puts "==> #{number_1} + #{number_2} = #{addition}"
# puts "==> #{number_1} - #{number_2} = #{subtraction}"
# puts "==> #{number_1} * #{number_2} = #{multiplication}"
# puts "==> #{number_1} / #{number_2} = #{division}"
# puts "==> #{number_1} % #{number_2} = #{modulo}"
# puts "==> #{number_1} ** #{number_2} = #{exponent}"