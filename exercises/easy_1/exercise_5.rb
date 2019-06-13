# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# def reverse_sentence(string)
#   return string.split.reverse.join(" ")
# end

def reverse_sentence(str)
  sent_out = []
  str.split.each { |word| sent_out.unshift(word) }
  sent_out.join(' ')
end

puts reverse_sentence('Hello World')
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'