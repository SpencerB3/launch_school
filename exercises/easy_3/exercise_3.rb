puts "Please write a word or multiple words:"
statement = gets.chomp
# puts "There are #{statement.gsub(" ", "").length} characters in the word \"#{statement}\"."
puts "There are #{statement.delete(" ").length} characters in the word \"#{statement}\"."

