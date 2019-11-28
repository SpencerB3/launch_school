# In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.

def xor?(value1, value2)
  value1 != value2
  # return true if value1 && !value2
  # return true if value2 && !value1
  # return false

  # return false if value1 == value2
  # return true
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
