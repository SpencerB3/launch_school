# def multisum(number)
#   sum = 0
#   1.upto(number).each do |num|
#     if num % 3 == 0 || num % 5 == 0
#       sum += num
#     end
#   end
#   puts sum
#   return sum
# end

def multisum(number)
  (1..number).select {|num| num % 3 == 0 || num % 5 == 0}.inject(:+)
  # multi_array = (1..number).select do |num|
  #   num % 3 == 0 || num % 5 == 0
  # end
  # p multi_array.inject(:+)
  # return multi_array
end


multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168