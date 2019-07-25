# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  new_string = ''
  string.each_char do |char|
    new_string << char << char
    # new_string += (char * 2)
  end
  p new_string
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
