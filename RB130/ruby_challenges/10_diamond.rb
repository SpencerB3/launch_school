
class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    range = ('B'..letter).to_a
    width = find_width(range.size)
    lines = generate_lines(range)

    lines.map { |line| line.center(width) }.join("\n") + "\n"
  end

  class << self
    private

    def find_width(num)
      width = 1
      count = 0

      while count < num
        width += 2
        count += 1
      end

      width
    end

    def generate_lines(range)
      half_diamond = first_half(range)
      half_diamond.concat(half_diamond[0...-1].reverse)
    end

    def first_half(range)
      result = []
      space = 1

      range.each do |letter|
        result << "#{letter}#{' ' * space}#{letter}"
        space += 2
      end

      ["A"].concat(result)
    end
  end
end
