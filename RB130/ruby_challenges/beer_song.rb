class BeerSong
  def self.verse(bottles)
    song_line(bottles)
  end

  def self.verses(line_1, line_2)
    result = []
    line_1.downto(line_2) do |line|
      result << song_line(line)
    end
    result.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end
  
  class << self
    private
    def song_line(bottles)
      case bottles
      when 0
        return "No more bottles of beer on the wall, no more bottles of beer.\n" +
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      when 1
        return "1 bottle of beer on the wall, 1 bottle of beer.\n" +
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 2
        return "2 bottles of beer on the wall, 2 bottles of beer.\n" +
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"  
      else
        return "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" +
        "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
      end
    end
  end
end
