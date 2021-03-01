# Given the array...

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

def anagram_sorter(array)
  sorter = {}
  array.each do |word|
    sorted_word = word.split('').sort.join
    if sorter[sorted_word].nil?
      sorter[sorted_word] = [word]
    else
      sorter[sorted_word].push(word)
    end
  end
  print_sorter(sorter)
end

def print_sorter(sorter)
  sorter.each_value { |v| p v }
end

anagram_sorter(words)
