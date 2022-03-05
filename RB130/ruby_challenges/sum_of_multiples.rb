class SumOfMultiples
  attr_reader :multiples

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  def initialize(*multiples)
    @multiples = (multiples.empty?) ? [3, 5] : multiples
  end

  def to(number)
    (1...number).select do |num|
      any_multiples?(num)
    end.sum
  end

  private

  def any_multiples?(num)
    multiples.any? do |n|
      (num % n).zero?
    end
  end
end
