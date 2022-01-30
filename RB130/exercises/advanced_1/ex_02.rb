# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

=begin
  Of note:
  1) with Procs, arguments are optional
  2) when called without an argument supplied (where one is expected), the return value of the argument will be nil.
  3) no error raised when an argument is not supplied

  LS answer:
  A new Proc object can be created with a call of proc instead of Proc.new
  A Proc is an object of class Proc
  A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
  - getting an ArgumentError while running this code in the second group
  - cannot initialize a Lambda with a ::new call - raises NameError
  - a lambda is a type of proc - #<Proc:0x00007f7f6a88c048@ex_02.rb:21 (lambda)>
  - -> may be used to initialize a lambda
  - a lambda requires an argument to be  assigned it its parameter(s) or an error will be raised
  - 

  A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
  A Lambda is actually a different variety of Proc.
  While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the   string displayed contains an extra "(lambda)" that is not present for regular Procs.
  A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.
=end

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin
  of note:
  1) methods require blocks if a yield is within the method body - if no block is supplied, an error will be raised
  2) it is not necessary to pass arguments to blocks even if the block has a parameter, then nil will be assigned to parameter

  LS
  - A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
  - If we have a yield and no block is passed, then an error is thrown.
=end

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

=begin
  - any extra parameter that are not assigned to arguments will be assigned to nil
  - an error will be raised if an unassigned variable is within a block

  If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
  Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.
=end

=begin
  blocks and Procs do  not require supplied arguments; lambdas do require arguments according to how they are defined
  lambdas are a type of Proc - both Procs and lambdas are objects.

  Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
  Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.
=end
