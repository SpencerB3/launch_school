def center_of(string)
  middle = string.size / 2
  if string.size.odd?
    string[middle]
  else
    string[middle - 1, 2]
  end
end

center_of('I love Ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
