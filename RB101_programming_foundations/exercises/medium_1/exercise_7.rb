# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(string)
  NUMBERS.each do |num|
    if string.include?(num)
      string.gsub!(num, (NUMBERS.index(num)).to_s)
    end
  end

  string
end

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
