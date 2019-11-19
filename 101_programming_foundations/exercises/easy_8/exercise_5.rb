# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

def substrings_at_start(string)
  new_string = ''
  result = []
  string.each_char do |char|
    new_string += char
    result << new_string
  end
  result
end

def substrings(string)
  result = []
  loop do
    result.concat(substrings_at_start(string))
    string = string[1..-1]
    break if string.size == 0
  end
   result
end

def palindromes(string)

  result = []
  all_substring = substrings(string)
  all_substring.each do |substring|
    if is_palindrome?(substring)
      result << substring
    end
  end
  result
end

def is_palindrome?(substring)
  substring == substring.reverse && substring.size > 1
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]