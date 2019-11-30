# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

def prompt(message)
  puts ">> #{message}"
end

prompt("Please write word or multiple words:")
word = gets.chomp
word_length = word.delete(' ').size

prompt("There are #{word_length} characters in \"#{word}\".")
