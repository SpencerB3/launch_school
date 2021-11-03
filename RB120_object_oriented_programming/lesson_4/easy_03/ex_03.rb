# Given the class below, how do we create two different instances of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# 1
first_cat = AngryCat.new('Sophie', 5)
# 2
second_cat = AngryCat.new('Fluffy', 2)

first_cat.hiss
second_cat.hiss
