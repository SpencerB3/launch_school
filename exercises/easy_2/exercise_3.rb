# puts ">> What is the bill?"
# bill = gets.chomp.to_f
# puts ">> What is the tip?"
# tip = gets.chomp.to_f

# tip = ((bill * tip) / 100).round(2)

# total = (tip + bill).round(2)

# puts "The tip is $#{tip}. " + \
#      "The total is $#{total}."

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



