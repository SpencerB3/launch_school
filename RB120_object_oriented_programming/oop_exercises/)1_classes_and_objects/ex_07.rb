# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

class Cat
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def greeting
    puts "Hello, my name is #{name}."
  end
end

kitty = Cat.new('Sophie')
kitty.greeting
puts kitty.name
