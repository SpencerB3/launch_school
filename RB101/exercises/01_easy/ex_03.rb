def stringy(num)
  result = ''

  num.times do |idx|
    if idx.even?
      result += '1'
    else
      result += '0'
    end
  end

  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'