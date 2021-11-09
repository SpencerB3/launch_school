# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# name = 42
# fluffy = Pet.new(name) # return value of '42' different ovject than the object to which the variable name refers
# name += 1 # here name is reassigned to a different Integer (43)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name
