# 100.times {|i| puts i if i % 2 == 1}

# value = 1

# while value <= 99
#   puts value 
#   value += 2
# end

# puts (1..99).select { |i| i.odd?}

(1..99).each {|i| puts i unless i % 2 == 0}