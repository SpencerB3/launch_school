# sum = 0
product = 1
puts ">> Please enter an integer greater than 0:"
integer = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
answer = gets.chomp
if answer == 's'
  (1..integer).inject {|sum, i| sum += i}
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else
  (1..integer).inject(1) {|i| product *= i}
  puts "The product of the integers between 1 and #{integer} is #{product}."
end

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
