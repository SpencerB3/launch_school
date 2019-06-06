# def stringy(number)
#   string = ""
#   number.times do |x|
#     if x % 2 == 0
#       string << "1"
#     else 
#       string << "0"
#     end
#   end

#   return string
# end

def stringy(length)
  string = ""
  length.times do |i|
    number = i % 2 == 0 ? "1" : "0"
    string << number
  end
  return string
end


puts stringy(6)

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'