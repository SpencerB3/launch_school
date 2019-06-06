# same as last problem, but this time leave alone words 4 characters and under
# iterate through split string, if element is longer than 4 chars, reverse it

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

