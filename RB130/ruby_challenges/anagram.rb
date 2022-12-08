class Anagram
  def initialize(anagram)
    @ana = anagram.downcase
  end

  def match(words)
    words.select do |word|
      word = word.downcase
      next if @ana == word
      anagram?(word)
    end
  end

  private

  def anagram?(word)
    @ana.split('').sort.join == word.split('').sort.join
  end
end
