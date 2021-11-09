# What would happen if I called the methods like shown below?

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # NoMethodError would be raised as the manufacturer method is a class method, not an instance method
tv.model

# Television.manufacturer
# Television.model # NoMethodError would be raised as the model method is an instance method, not a class method
