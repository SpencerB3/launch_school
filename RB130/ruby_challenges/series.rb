  class Series
  attr_reader :num_array
  
  def initialize(num_string)
    @num_array = num_string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > num_array.size
    # result = []

    num_array.each_cons(length).to_a
    
    # @num_array.each_index do |idx|
    #   sub_array = num_array[idx...(idx + total_nums)]
    #   result << sub_array unless sub_array.size < total_nums

    # end

    # result
  end
end
