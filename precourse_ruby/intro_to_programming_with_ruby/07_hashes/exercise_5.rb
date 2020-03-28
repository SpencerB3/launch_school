person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

# p person.include?(:hobbies)

if person.has_value?("web developer")
  puts "Nice!"
else
  puts "Too bad!"
end