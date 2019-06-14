# What will each of the 4 puts statements print?

require 'date'

puts Date.new
# -4712-01-01 defaults to the Julian year
puts Date.new(2016)
# 2016, month - day defaults to 01
puts Date.new(2016, 5)
# 2016-05. day default
puts Date.new(2016, 5, 13)
# no default values