# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# puts ">> What is the bill?"
# bill = gets.chomp.to_f

# puts ">> What is the tip percentage?"
# tip_percentage = gets.chomp.to_f

# tip = ((bill * tip_percentage)/100).round(2)

# total = (bill + tip).round(2)

# puts "The tip is $#{tip}."
# puts "The total is $#{total}."

#--------------------

def prompt(message)
  puts "#{message}"
end
prompt("What is the bill?")
bill = gets.chomp.to_f
prompt("What is the tip?  For example, 15 for 15%, 10 for 10%.")
tip = gets.chomp.to_f / 100

tip = (bill * tip).round(2)
total = (tip + bill).round(2)

prompt("The bill is #{bill}.")
prompt("The tip is #{tip}.")
prompt("-----------")
prompt("The total is #{total}.")
