class Octal
  attr_reader :number

  def initialize(string)
    @number = string
  end

  def to_decimal
    return 0 if invalid_octal?
    
    decimal_num = 0
    reversed_num = number.to_i.digits
    
    reversed_num.each_with_index do |n, idx|
      decimal_num += (n * (8**idx))
    end

    decimal_num
  end

  private

  def invalid_octal?
    number =~ /[a-z89]/i
  end
end
