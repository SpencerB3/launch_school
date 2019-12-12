# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

# program reads text file
# prints longest sentence in file => print string, also prints length
# sentences end in . ? !
# any sequence of non alpha chars is a word

# create a text file, have ruby open the text file (use read?)
# first split the text into sentences using a period question mark, or exclamation point
#   then count the words in the sentence

#  perhaps split the text into words, and everytime a end punctionation is found, a key is created

# print out the longest sentence as well aas the word count

# def longest_sentence(text)
#   declare an array
#   have ruby access the file => File.read
#     split the file according to regex then iterate through
#     put each element into an array
#   then iterate through that array
#   sort through array by length
#   print longest sentence and its length
# end

# def longest_sentence(txt)
#   set an empty aarray
#   have ruby access text file
#   split and then iterate over text file
#     push sentences into array
#   end
#    sort array by length, longest first
#   print first element
#   print first element length

def longest_sentence(text)
  text = File.read('text_1.txt')
  sentences = text.split(/\.|\?|!/)
  sorted_sentences = sentences.sort { |a, b| b.size <=> a.size }
  puts sorted_sentences[0]
  puts sorted_sentences[0].split.size
end

longest_sentence('text_1.txt')

# text = File.read('text_1.txt')
# sentences = text.split(/\.|\?|!/)
# sorted_sentences = sentences.sort { |a, b| b.size <=> a.size }
# longest_sentence = sorted_sentences[0]
# number_of_words = longest_sentence.split.size
# puts longest_sentence
# puts number_of_words

# text = File.read('text_1.txt')
# sentences = text.split(/\.|\?|!/)
# longest_sentence = sentences.max_by { |sentence| sentence.split.size }
# longest_sentence = longest_sentence.strip
# number_of_words = longest_sentence.split.size
# puts longest_sentence
# puts number_of_words
