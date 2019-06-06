# puts "What is your name?"
# name = gets.chomp
# if name[-1] == "!"
#   name.chop!
#   puts "HELLO #{name.upcase}. WHY ARE YOU SCREAMING?"
# else
#   puts "Hello #{name}."
# end

def prompt("message")
  puts "#{message}"
end

prompt("What is your name?")
name = gets.chomp
if name.include?("!")
  name = name.chop
  puts "HELLO #{name.upcase}.  WHY ARE YOU YELLING?!"
else
  puts "Hello, #{name}."

