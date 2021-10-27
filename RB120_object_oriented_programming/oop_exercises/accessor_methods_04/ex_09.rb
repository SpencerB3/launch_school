# Using the following code, multiply @age by 2 upon assignment, then multiply @age by 2 again when @age is returned by the getter method.

class Person
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private

  def double(num)
    num * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age
