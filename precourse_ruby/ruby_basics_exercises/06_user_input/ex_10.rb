# Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

# Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def read_number
  loop do
    puts ">> Please enter a positive or negative integer:"
    num = gets.chomp
    return num.to_i if valid_number?(num)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

number_1 = nil
number_2 = nil

loop do
  number_1 = read_number
  number_2 = read_number

  break if number_1 * number_2 < 0

  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."
end

result = number_1 + number_2

puts "#{number_1} + #{number_2} = #{result}"
