# Write a method that can rotate the last n digits of a number. For example:


def rotate_rightmost_digits(number, n)

  number_array = number.to_s.split('')
  first_half = number_array[0...-n]
  second_half = number_array[-n..n]

  (first_half + rotate_array(second_half)).join.to_i
end

def rotate_array(array)
  array.empty? ? array : array[1..-1] + array[0]
  # array.empty? ? array : array.push(array.shift)
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917