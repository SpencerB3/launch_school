# In the previous exercise, you wrote a program to solicit a password. In this exercise, you should modify the program so it also requires a user name. The program should solicit both the user name and the password, then validate both, and issue a generic error message if one or both are incorrect; the error message should not tell the user which item is incorrect.

PASSWORD = 'SecreT'
USERNAME = 'admin'

loop do
  puts '>> Please enter your user name:'
  username_try = gets.chomp

  puts '>> Please enter your password:'
  password_try = gets.chomp
  
  break if password_try == PASSWORD && username_try == USERNAME
    
  puts '>> Authorization Failed!'
end

puts 'Welcome!'
