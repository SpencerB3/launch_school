# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

def word_sizes(words)
  # word_size_hash = {}
  word_size = Hash.new(0)

  words.split.each do |word|
    word_size[word.size] += 1
    # if word_size_hash[word.size].nil?
    #   word_size_hash[word.size] = 1
    # else
    #   word_size_hash[word.size] += 1
    # end
  end
  word_size
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
