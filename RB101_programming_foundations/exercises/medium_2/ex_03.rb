# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(string)
  percentages = Hash.new(0)
  lowercase_count = 0
  uppercase_count = 0
  neither = 0

  string.each_char do |char|
    if char =~ /[a-z]/
      lowercase_count += 1
    elsif char =~ /[A-Z]/
      uppercase_count += 1
    else
      neither += 1
    end
  end

  lowercase_percentage = (lowercase_count / string.size.to_f) * 100
  uppercase_percentage = (uppercase_count.to_f / string.size) * 100
  neither_percentage = (neither.to_f / string.size) * 100

  percentages[:lowercase] = lowercase_percentage
  percentages[:uppercase] = uppercase_percentage
  percentages[:neither] = neither_percentage

  percentages
end

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
