# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   true
#   end
# end

def leap_year?(year)
  if year % 4 == 0
    return true unless year % 100 == 0 && year % 400 != 0
  end
  false
end

puts leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
puts leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
leap_year?(400) == true