# def count_down(number)
#   if number <= 0
#     puts number
#     return
#   else
#     puts number
#     count_down(number -1)
#   end

# end

def count_down(number)
  return number if number <= 0
  puts number
  count_down(number -1)
end

puts count_down(-3)
puts count_down(10)