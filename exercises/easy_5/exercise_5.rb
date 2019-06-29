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
