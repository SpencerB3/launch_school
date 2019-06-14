# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  # string.downcase!
  # string.gsub!(/[., ']/, ' ')
  # string = string.downcase.delete('^a-z')
  # string == string.reverse
  string = string.downcase.delete(" ',")
  palindrome?(string)
end


puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false