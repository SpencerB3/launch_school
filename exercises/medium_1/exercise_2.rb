# Write a method that can rotate the last n digits of a number. For example:

def rotate_rightmost_digits(number, n)
  number_array = number.to_s.chars
  number_array[-n..-1] = rotate_array(number_array[-n..-1])
  number_array.join.to_i
end

def rotate_array(array)
  array.empty? ? array : array[1..-1] << array[0]
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
