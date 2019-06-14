# What do each of these puts statements output?

a = %w(a b c d e)

puts a.fetch(7)
# IndexError
puts a.fetch(7, 'beats me')
# will return 'beats me'
puts a.fetch(7) { |index| index**2 } 
# returns 49

# a = %w(a b c d e)
# # puts a.fetch(7)
# puts a.fetch(7, 'beats me')
# puts a.fetch(7) { |index| index**2 }