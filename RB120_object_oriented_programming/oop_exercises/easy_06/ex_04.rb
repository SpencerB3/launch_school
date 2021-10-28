# Write a class that will display:

# ABC
# xyz

class Transform
  attr_accessor :string

  def initialize(string)
    @string = string
  end
  
  def uppercase
    string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
