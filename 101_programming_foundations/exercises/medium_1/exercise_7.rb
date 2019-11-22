# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=begin
P
string to string
A
set constants of number string to number key value pair above method
iterate through Constant
  if any word is to be found in the hash
    change it to a string number
  end
end
return string
=end

NUMBER_STRINGS = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
                   'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8',
                   'nine' => '9' }.freeze

def word_to_digit(string)
  NUMBER_STRINGS.each do |letter, num|
    string.gsub!(letter, num) if string.include?(letter)
  end
  string
end

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
