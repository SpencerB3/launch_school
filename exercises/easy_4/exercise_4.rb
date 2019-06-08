# def leap_year?(year)
#   if year >= 1752
#     (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
#   else
#     year % 4 == 0
#   end
# end

def leap_year?(year)

  if year > 1752 && year % 4 == 0
    return true
  elsif year % 400 == 0
    return true
  elsif year % 100 == 0
  else
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
puts leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true