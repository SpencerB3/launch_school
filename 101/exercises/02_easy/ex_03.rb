print "What is the bill? "
bill = gets.to_f

print "What is the tip percentage? "
tip_percentage = gets.to_f

tip = (bill * tip_percentage) / 100
total = tip + bill

puts "The tip is $#{tip}"
puts "The total is $#{total}"

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0
