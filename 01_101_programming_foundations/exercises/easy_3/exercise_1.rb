# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

def prompt(message)
  puts ">> #{message}"
end

array = []

prompt('Enter the 1st number:')
first = gets.chomp.to_i
array << first

prompt('Enter the 2nd number:')
array << gets.chomp.to_i

prompt('Enter the 3rd number:')
array << gets.chomp.to_i

prompt('Enter the 4th number:')
array << gets.chomp.to_i

prompt('Enter the 5th number:')
array << gets.chomp.to_i

prompt('Enter the last number:')
sixth = gets.chomp.to_i

if array.include?(sixth)
  puts "The number #{sixth} appears in #{array}."
else
  puts "The number #{sixth} does not appear in #{array}."
end
