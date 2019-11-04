# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
integer = nil
loop do
  puts ">> Please enter an integer greater than 0."
  integer = gets.chomp.to_i
  break if integer > 0
  puts "Invalid entry.  Number must be greater than 0."
end

answer = nil
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  answer = gets.chomp.downcase
  break if answer == 's' || answer == 'p'
  puts "Invalid entry."
end

sum = (1..integer).to_a.reduce(0, :+)
# sum = (1..integer).sum
product = (1..integer).to_a.inject(:*)

if answer == 's'
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else
  puts "The product of the integers between 1 and #{integer} is #{product}."
end

#----------

# sum = 0
# product = 1
# puts ">> Please enter an integer greater than 0:"
# integer = gets.chomp.to_i
# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# answer = gets.chomp
# if answer == 's'
#   (1..integer).inject {|sum, i| sum += i}
#   puts "The sum of the integers between 1 and #{integer} is #{sum}."
# else
#   (1..integer).inject(1) {|i| product *= i}
#   puts "The product of the integers between 1 and #{integer} is #{product}."
# end

# def compute_sum(number)
#   total = 0
#   1.upto(number) {|i| total+= i}
#   total
# end

# def compute_product(number)
#   total = 1
#   1.upto(number) {|i| total *= i}
#   total
# end

# puts ">> Please enter an integer greater than 0:"
# integer = gets.chomp.to_i
# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# answer = gets.chomp

# if answer == 's'
