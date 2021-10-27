# Using the class definition from step #3, let's create a few more people -- that is, Person objects. If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{self.first_name} #{self.last_name}".strip
  end

  def name=(name)
    parse_full_name(name)
  end

  private

  def parse_full_name(name)
    self.first_name, self.last_name = name.split
    self.last_name = name[1].nil? ? '' : name.split[1]
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name
