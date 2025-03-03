def print_in_box(statement)
  puts "+-#{'-' * statement.size}-+"
  puts "| #{' ' * statement.size} |"
  puts "| #{statement} |"
  puts "| #{' ' * statement.size} |"
  puts "+-#{'-' * statement.size}-+"
end


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
