# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_text = []
  text.each_char do |char|
    if ALPHABET.include?(char)
      clean_text << char
    else
      clean_text << ' ' unless clean_text.last == ' '
    end
  end
  clean_text.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
