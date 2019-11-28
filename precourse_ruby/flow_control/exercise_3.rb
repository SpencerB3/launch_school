puts ">> Please enter a number from 0 to 100."
number = gets.chomp.to_i
if number < 0
  puts "You entered a negative number"
elsif number <= 50 && number >= 0
  puts "You number is between 0 and 50."
elsif number > 50 && number <= 100
  puts "Your number is between 51 and 100."
else
  puts "Your number is above 100."
end