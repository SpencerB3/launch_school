# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(string, number)
  num.times { puts string }
  # puts ("#{string}\n" * number)
end

puts repeat("hello", 3)
