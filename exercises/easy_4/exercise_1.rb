def short_long_short(string1, string2)
  new_string = ''
  string1.size > string2.size ? new_string = (string2 + string1 + string2) : new_string = (string1 + string2 + string1)
  # if string1.size > string2.size
  #   new_string = (string2 + string1 + string2)
  # else 
  #   new_string = (string1 + string2 + string1)
  # end
  puts new_string
  new_string

end



short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"