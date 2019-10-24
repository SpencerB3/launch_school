# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

def twice(num)
  num.size.even? && double?(num)? num : num * 2
end

def double?(num)
  number_string = num.to_s
  middle = number_string.size / 2
  left_side = middle.zero? ? '' : number_string[0..(middle - 1)]
  right_side = number_string[middle..-1]
  left_side == right_side
end

twice(37) == 74
twice(44) == 44
twice(334_433) == 668_866
twice(444) == 888
twice(107) == 214
twice(103_103) == 103_103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
