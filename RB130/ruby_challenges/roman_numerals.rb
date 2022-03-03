class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }.to_a.sort_by { |_, value| value }.reverse

  def initialize(number)
    @number = number
  end

  def to_roman
    result = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      next unless multiplier > 0
      result += (key * multiplier)

      to_convert = remainder
    end
    result
  end
end
