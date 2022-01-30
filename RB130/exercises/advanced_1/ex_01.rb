factorial = Enumerator.new do |yielder|
  accumulator = 0
  number = 0

  loop do
    accumulator = number.zero? ? 1 : number * accumulator
    yielder << accumulator
    number += 1
  end
end

# External iterators

7.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
3.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
7.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
