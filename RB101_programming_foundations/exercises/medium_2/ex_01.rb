# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

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
