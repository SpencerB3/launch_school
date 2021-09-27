def ascii_value(string)

  value = 0

  string.each_char do |char|

    value += char.ord

  end
  value
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
