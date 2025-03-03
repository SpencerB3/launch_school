def calculate_sum(num)
  (1..num).to_a.sum
end

def calculate_product(num)
  result = 1

  (1..num).to_a.each  { |n| result *= n }

  result
end

puts '>> Please enter an integer greater than 0:'
number = gets.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = calculate_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
else
  product = calculate_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
end

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
