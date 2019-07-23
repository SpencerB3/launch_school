# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

LOWER_CASE = ('a'..'z').to_a
UPPER_CASE = ('A'..'Z').to_a

def letter_case_count(string)
  case_count = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    if LOWER_CASE.include?(char)
      case_count[:lowercase] += 1
    elsif UPPER_CASE.include?(char)
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end
  case_count
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
