# Write a program that asks the user for their age in years, and then converts that age to months.

puts "What is your age in years?"

years = gets.chomp.to_i

puts "You are #{years * 12} months old."
