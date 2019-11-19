# Looping

### Controlling a Loop

```Ruby
loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
```

Try running this code a few times (either from a code file or in irb) and make a note of what you notice.

Things to notice:

Upon entering the loop, the variable `number` is assigned a number between 1 and ten inclusive. `Hello!` is then printed.  We then enter into an `if` statement that checks if `number` is equal to the number `5`.  If so, the string  `Exiting...` is printed followed by a `break`command that sends us out of the loop.  If `number` does not evaluate to `5` then, the loop repeats itself.

1. `Hello!` usually is printed multiple times
2. `Exiting...` is only printed once
3. The `break` command pulls the code out of the loop

### Array

```Ruby
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end
```

What do you think will be output by the loop?

```Ruby
"I'm the color green!"
"I'm the color blue!"
"I'm the color purple!"
"I'm the color orange!"
```







