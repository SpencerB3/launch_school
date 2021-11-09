# What happens in each of the following cases:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# hello = Hello.new
# hello.hi # => prints 'Hello'

# hello = Hello.new
# hello.bye # => raises NoMethodError since there is no bye method for the Goodbye class to access

# hello = Hello.new
# hello.greet # => raises ArgumentError since no argument was provided

# hello = Hello.new
# hello.greet("Goodbye") # => prints out 'Goodbye' as the greet method is inherited from the Greeting class

Hello.hi # => raises NoMethodError since the method hi is an instance method and cannot be called on the class itself
