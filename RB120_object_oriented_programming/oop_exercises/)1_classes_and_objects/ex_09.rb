#Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

class Cat
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello, my name is #{name}."
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
