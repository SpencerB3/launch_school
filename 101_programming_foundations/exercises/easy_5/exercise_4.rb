# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

def swap(str)
  new_str = str.split.map do |word| 
    word[0], word[-1] = word[-1], word[0] 
    word
  end
  new_str.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
