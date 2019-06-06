# puts (1..99).select {|i| i.even?}

# (1..99).each {|i| puts i unless i % 2 == 1}

value = 1
while value <= 99
  puts value if value.even?
  value += 1
end

