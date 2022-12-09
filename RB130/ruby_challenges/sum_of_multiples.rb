# My first solution commented out below.

class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = !multiples.empty? ? multiples : [3, 5]
  end

  def to(num)
    (1...num).select do |n|
      any_multiples?(n)
    end.sum
  end

  private

  def any_multiples?(n)
    multiples.any? { |multiple| (n % multiple).zero? }
  end
end

# class SumOfMultiples
#   def initialize(*multiples)
#     @multiples = multiples
#   end

#   def to(num)
#     self.class.to(num, @multiples)
#   end

#   def self.to(num, multiples = [3, 5])
#     sum = 0

#     1.upto(num - 1) do |n|
#       multiples.each do |multiple|
#         if (n % multiple).zero?
#           sum += n
#           break
#         end
#       end
#     end

#     sum
#   end
# end
