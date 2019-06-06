SQMETERS_TO_SQFEET = 10.7639

puts ">> Enter the length in meters:"
length = gets.chomp.to_f 
puts ">> Enter the width in meters:"
width = gets.chomp.to_f

area_meters = (length * width).round(2)

area_feet = (area_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area is #{area_meters} square meters" + \
     "(the area in square feet is #{area_feet}."

