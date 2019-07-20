# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  characters = string.split('').map do |char|
    if char =~ /[A-Z]/
      char.downcase
    elsif char =~ /[a-z]/
      char.upcase
    else
      char
    end
  end
  characters.join

  # new_string = ''
  # string.each_char do |char|
  #   if UPPERCASE.include?(char)
  #     new_string += char.downcase
  #   else
  #     new_string += char.upcase
  #   end
  # end
  # p new_string
end
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
