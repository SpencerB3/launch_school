# In the previous exercise, you wrote a program that asks the user if they want the program to print "something". However, this program recognized any input as valid: if you answered anything but y, it treated it as an n response, and quit without printing anything.

# Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again. Keep asking for a response until you receive a valid y or n response. In addition, your program should allow both Y and N (uppercase) responses; case sensitive input is generally a poor user interface choice. Whenever possible, accept both uppercase and lowercase inputs.

answer = nil

loop do
  puts "Do you want me to print something?"
  answer = gets.chomp.downcase
  break if %w(y n).include?(answer)
  
  puts "Invalid choice!  Please enter y or n"
end

puts 'Something' if answer == 'y'
