# Using the code from the previous exercise, add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again.

class Cat
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def greeting
    puts "Hello, my name is #{name}."
  end
end

kitty = Cat.new('Sophie')
kitty.greeting
kitty.name = 'Luna'
kitty.greeting
