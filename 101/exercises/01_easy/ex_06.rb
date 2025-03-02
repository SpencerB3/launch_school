def triangle(lines)
  stars = 1
  
  until lines.zero?
    puts "#{" " * lines}#{"*" * stars}"
    stars += 1
    lines -= 1
  end
end

triangle(5)
#     *
#    **
#   ***
#  ****
# *****

triangle(9)
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
