number_array = []
puts "==>  Enter the 1st number:"
number_1 = gets.chomp.to_i
number_array << number_1
puts "==>  Enter the 2nd number:"
number_2 = gets.chomp.to_i
number_array << number_2
puts "==>  Enter the 3rd number:"
number_3 = gets.chomp.to_i
number_array << number_3
puts "==>  Enter the 4th number:"
number_4 = gets.chomp.to_i
number_array << number_4
puts "==>  Enter the 5th number:"
number_5 = gets.chomp.to_i
number_array << number_5
puts "==>  Enter the last number:"
last_number = gets.chomp.to_i
# number_array << number_6

if number_array.include?(last_number)
  puts "The number #{last_number} appears in #{number_array}."
else
  puts "The number #{last_number} does not appear in #{number_array}."
end


