x = 0
3.times do
  x += 1
end
puts x
# will print 3 to the console

y = 0
3.times do
  y += 1
  x = y
end
puts x
# will error since the variable x was only defined in the inner scope of the do/end block, not in the global frame