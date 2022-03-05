  class Series
  attr_reader :number_string

  def initialize(str)
    @number_string = str
  end

  def slices(parts)
    raise ArgumentError.new if parts > number_string.size

    result = []
    counter = 0

    while counter + parts <= number_string.size
      result << cut_slice(parts, counter)
      counter += 1
    end

    result
  end

  private

  def cut_slice(parts, idx)
    number[idx, parts].chars.map(&:to_i)
  end
end

l = Series.new('01234')
l.slices(1)
