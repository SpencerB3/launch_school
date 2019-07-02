# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.


def crunch(string)
  new_string = ''
  i = 0
  while i < string.length
    unless string[i] == string[i + 1]
      new_string += string[i]
    end
    i += 1
  end
  p new_string
  new_string
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
