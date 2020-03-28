# Modify the code below so "Hello!" is printed 5 times.

say_hello = true
iterations = 1

while say_hello
  puts 'Hello!'
  say_hello = false if iterations == 5
  iterations += 1
end
