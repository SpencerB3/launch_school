# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.
puts "==> Enter the first number:"
number_1 = gets.chomp.to_i
puts "==> Enter the second number:"
number_2 = gets.chomp.to_i


puts "==> #{number_1} + #{number_2} = #{number_1 + number_2}"
puts "==> #{number_1} - #{number_2} = #{number_1 - number_2}"
puts "==> #{number_1} * #{number_2} = #{number_1 * number_2}"
puts "==> #{number_1} / #{number_2} = #{number_1 / number_2}"
puts "==> #{number_1} % #{number_2} = #{number_1 % number_2}"
puts "==> #{number_1} ** #{number_2} = #{number_1 ** number_2}"

