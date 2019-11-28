def evaluate_num(number)
  case 
  when number < 0
    puts "You entered a negative number"
  when number <= 50
    puts "You number is between 0 and 50."
  when number <= 100
    puts "Your number is between 51 and 100."
  else
    puts "Your number is above 100."
  end
end

puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

evaluate_num(number)