# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# def reverse_words(string)
#   new_array = string.split.map do |ele|
#     if ele.length > 4
#       ele.reverse
#     else
#       ele
#     end
#   end
#     return new_array.join(" ")
# end

def reverse_words(string)
  words = []
  string.split.each do |word|
    if word.size >= 5
      word.reverse!
    end
    words << word
  end
  return words.join(" ")
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

