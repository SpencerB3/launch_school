x = ''
while x != "STOP" do
  puts ">> What's the weather like outside?"
  info = gets.chomp
  puts ">> Should I ask again?" 
  x = gets.chomp
end