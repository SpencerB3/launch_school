class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 1

    sum = count_divisors(num)
    
    if sum > num
      'abundant'
    elsif sum < num
      'deficient'
    else
      'perfect'
    end
  end

  class << self
    private

    def count_divisors(num)
      (1...num).select do |n|
        num % n == 0
      end.sum
    end
  end

end
