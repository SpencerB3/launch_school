def average(arr)
  # sum = 0
  # arr.each {|num| sum += num}
  # return sum / arr.length

  sum = arr.reduce {|sum, num| sum + num}
  return sum/arr.count

end



puts average([1, 5, 87, 45, 8, 8.5])
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40