class Octal
  attr_reader :number

  def initialize(string)
    @number = string
  end

  def to_decimal
    return 0 unless valid?

    decimal = 0
    number.to_i.digits.each_with_index do |num, idx|
      decimal += (num * (8**idx))
    end
    decimal
  end

  private

  def valid?
    number.chars.all? { |char| char.match?(/[0-7]/) }
  end
end
