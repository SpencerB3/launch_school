# What is the result of executing the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
puts oracle.predict_the_future  
#=> "You will" + one of three string elements from the returned array of `choices` method
