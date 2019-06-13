# What does this print out? Can you explain these results?

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# BOB
# BOB

# the upcase! will modify the reference in memory