# In an earlier exercise, you wrote a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. Modify this program so it repeats itself after each input/print iteration, asking for a new number each time through. The program should keep running until the user enters q or Q.

number_of_lines = nil
input_string = nil

loop do

  loop do
    puts '>> How many output lines do you want? ' +
         'Enter a number >= 3: (Q to quit)'
    input_string = gets.chomp.downcase
    break if input_string == 'q'

    number_of_lines = input_string.to_i
    break if number_of_lines >= 3

    puts "That's not enough lines"
  end
  break if input_string == 'q'

  number_of_lines.times { puts 'Launch School is the best!' }

end
