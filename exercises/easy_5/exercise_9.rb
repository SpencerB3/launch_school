def crunch(string)

  new_string = ''

  string.each_char.with_index do |char, i|

    if string[i] == string[i + 1]
      new_string << string[i]
    end
  end
  new_string

end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''