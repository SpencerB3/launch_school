SQ_FEET_PER_SQ_METER = 10.7639

puts 'Enter the length of the room in meters:'
length = gets.to_f
puts 'Enter the width of the room in meters:'
width = gets.to_f

area_meters = length * width
area_feet = area_meters * SQ_FEET_PER_SQ_METER
formatted_area_feet = format('%0.2f', area_feet)

puts "The area of the room is #{area_meters} square meters " +
     "(#{formatted_area_feet} square feet)."

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
