# What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(2000)
puts big_cube.volume
