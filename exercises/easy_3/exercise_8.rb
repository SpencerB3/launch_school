def palindrome?(string)
  string == string.reverse
  # if string == string.reverse
  #   return true
  # else
  #   return false
  # end
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true