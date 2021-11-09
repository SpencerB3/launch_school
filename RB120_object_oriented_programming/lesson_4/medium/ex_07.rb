# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status # => status would be a better name as its usually better to not include the class name when naming methods
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end
