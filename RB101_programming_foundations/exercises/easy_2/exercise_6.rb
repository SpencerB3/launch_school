# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# (1..99).each {|i| puts i if i.odd?}

# puts (1..99).select {|i| i.odd?}

# 1.upto(99) {|i| puts i if i.odd?}

# 100.times {|i| puts i if i % 2 == 1}
# ------------
# value = 1

# while value <= 99
#   puts value 
#   value += 2
# end

# puts (1..99).select { |i| i.odd?}

(1..99).each {|i| puts i unless i % 2 == 0}
