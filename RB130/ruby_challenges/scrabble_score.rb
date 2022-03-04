class Scrabble
  attr_reader  :word
  
  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '')
    points = 0

    letters.each_char do |char|
      POINTS.each do |key, value|
        points += value if key.include?(char)
      end
    end

    points
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
