words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# sort words, iterature through hash, if hash does not exist, give it the value of 1

# sort out the values and print them to console

hash = {}

words.each do |word|
  key = word.split("").sort.join("")
  if hash[key] == nil
    hash[key] = [word]
  else
    hash[key].push(word)
  end
end

hash.each_value do |v|
  p v
end


