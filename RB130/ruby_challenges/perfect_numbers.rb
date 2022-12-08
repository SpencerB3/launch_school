class PerfectNumber
  def self.classify(num)
    raise StandardError if num.negative?  
    sum = find_sum_divisors(num)
    identify_number(sum, num)
  end

  class << self
    private
  
    def find_sum_divisors(num)
      (1...num).each.with_object([]) do |n, divisors|
        divisors << n if num % n == 0
      end.sum
    end
  
    def identify_number(sum, num)
      return 'abundant'  if sum > num
      return 'deficient' if sum < num
      'perfect'
    end
  end
end
