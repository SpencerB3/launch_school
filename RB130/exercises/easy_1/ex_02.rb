def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'
