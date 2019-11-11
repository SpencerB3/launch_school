# Write a method that will take a short line of text, and print it within a box.

def print_in_box(string)
  horizontal_line = "+-#{'-' * string.size}-+"
  blank_line = "| #{' ' * string.size} |"

  puts horizontal_line
  puts blank_line
  puts "| #{string} |"
  puts blank_line
  puts horizontal_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
