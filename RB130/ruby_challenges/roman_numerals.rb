class RomanNumeral
  def initialize(num)
    @decimal_num = num
  end

  def to_roman
    roman_numeral = ''
    places = @decimal_num.to_s.size

    @decimal_num.digits.reverse.each do |num|
      roman_numeral += find_roman_numeral(num, places) unless num.zero?
      places -= 1
    end

    roman_numeral
  end

  def find_roman_numeral(num, place)
    case place
    when 4
      thousand_place_numeral(num)
    when 3
      hundred_place_numeral(num)
    when 2
      ten_place_numeral(num)
    else
      one_place_numeral(num)
    end
  end

  def thousand_place_numeral(num)
    'M' * num
  end

  def hundred_place_numeral(num)
    case num
    when (1..3) then 'C' * num
    when 4      then 'CD'
    when 5      then 'D'
    when 6      then 'DC'
    when 7      then 'DCC'
    when 8      then 'DCCC'
    when 9      then 'CM'
    end
  end

  def ten_place_numeral(num)
    case num
    when (1..3) then 'X' * num
    when 4      then 'XL'
    when 5      then 'L'
    when 6      then 'LX'
    when 7      then 'LXX'
    when 8      then 'LXXX'
    when 9      then 'XC'
    end
  end

  def one_place_numeral(num)
    case num
    when (1..3) then 'I' * num
    when 4      then 'IV'
    when 5      then 'V'
    when 6      then 'VI'
    when 7      then 'VII'
    when 8      then 'VIII'
    when 9      then 'IX'
    end
  end
end
