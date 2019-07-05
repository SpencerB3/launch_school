# Write a method that will take a short line of text, and print it within a box.

def print_in_box(banner)
  horizontal_rule = "+#{'-' * (banner.length + 2)}+"
  empty_line = "|#{' ' * (banner.length + 2)}|"
  
  puts horizontal_rule
  puts empty_line
  puts "| #{banner} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
