# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name  # => the @ at the beginning of the variable name means it is an instance variable
  end
end

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables # => [:name]
p orange.instance_variables # => []
