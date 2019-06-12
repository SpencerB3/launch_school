# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# puts (1..99).select {|i| i.even?}

# value = 1
# while value <= 99
#   puts value if value.even?
#   value += 1
# end

1.upto(99) {|i| puts i if i.even?}
