# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

puts ">> What is your name?"
name = gets.chomp

if name[-1] == '!'
  name.chop! # or name = name[0...-1].upcase
  puts "HELLO #{name.upcase}. WHY ARE YOU SCREAMING?"
else
  puts "Hello #{name}."
end

