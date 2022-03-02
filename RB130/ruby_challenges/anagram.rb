class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    matches = []
    array.each do |string|
      next if @word.downcase == string.downcase
      matches << string if anagram?(@word, string)
    end

    matches
  end

  private

  def sorted_word(word)
    word.downcase.split('').sort.join
  end

  def anagram?(word1, word2)
    sorted_word(word1) == sorted_word(word2)
  end
end
