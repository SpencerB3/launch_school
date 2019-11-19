# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

def substrings_at_start(string)
  accumulated_array = []
  new_string = ''
  string.each_char do |char|
    new_string += char
    accumulated_array << new_string
  end
  accumulated_array
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

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
