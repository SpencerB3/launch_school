# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

number_array = []

puts "==> Enter the first number:"
number_1 = gets.chomp.to_i
number_array << number_1

puts "==> Enter the second number:"
number_2 = gets.chomp.to_i
number_array << number_2

puts "==> Enter the third number:"
number_3 = gets.chomp.to_i
number_array << number_3

puts "==> Enter the fourth number:"
number_4 = gets.chomp.to_i
number_array << number_4

puts "==> Enter the fifth number:"
number_5 = gets.chomp.to_i
number_array << number_5

puts "==> Enter the sixth number:"
number_6 = gets.chomp.to_i

if number_array.include?(number_6)
  puts "The number #{number_6} appears in #{number_array}."
else
  puts "The number #{number_6} does not appear in #{number_array}."
end

