class BeerSong
  def self.verse(line)
    case line
    when (3..99) then standard_verse(line)
    when 2       then antepenultimate_verse
    when 1       then penultimate_verse
    when 0       then last_verse
    end
  end

  def self.verses(starting_verse, ending_verse)
    result = ''
    starting_verse.downto(ending_verse) do |line|
      result += verse(line)
      result += "\n" unless line == ending_verse
    end
    result
  end

  def self.lyrics
    verses(99, 0)
  end
  # rubocop:disable Metrics/LineLength
  class << self
    private

    def standard_verse(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end

    def antepenultimate_verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def penultimate_verse
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def last_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
  # rubocop:enable Metrics/LineLength
end
