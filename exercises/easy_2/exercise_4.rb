# puts ">> What is your age?"
# age = gets.chomp.to_i

# puts ">> At what age would you like to retire?"
# retirement_age = gets.chomp.to_i

# years_to_retirement = (retirement_age - age)

# current_year = Date.year.now
# # Date.time

# puts "It's #{current_year}. You will retire #{current_year + years_to_retirement}. " + \
#      "You only have #{years_to_retirement} years to go! "

print 'What is your age? '
current_age = gets.to_i

print 'At what age would you like to retire? '
retirement_age = gets.to_i

current_year = Time.now.year
years_to_retirement = (retirement_age - current_age)
year_of_retirement = current_year + years_to_retirement

puts "It's #{current_year}. You will retire in #{year_of_retirement}. " + \
     "You only have #{years_to_retirement} years to go! "
