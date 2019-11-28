# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

def reverse_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word}.join(' ')
  # reversed_string = string.split.map do |word|
  #   if word.size >= 5
  #     word.reverse
  #   else
  #     word
  #   end
  # end
  # reversed_string.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
