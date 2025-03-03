current_date = Time.new
current_year = current_date.year

print 'What is your age? '
age = gets.to_i

print 'At what age would you like to retire? '
retirement_age = gets.to_i

years_to_retirement = retirement_age - age
retirement_year = current_year + years_to_retirement

puts "It's #{current_year}.  You will retire in #{retirement_year}."
puts "You only have #{years_to_retirement} years to go!"

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
