# Continuing with our Person class definition, what does the below print out?

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

  def to_s
    name
  end

  private

  def parse_full_name(name)
    self.first_name, self.last_name = name.split
    self.last_name = name[1].nil? ? '' : name.split[1]
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"  
# => Before to_s method: 
# The person's name is: #<Person:0x00007faa3712c0a8>
# => After to_s method:
# The person's name is: Robert Smith
