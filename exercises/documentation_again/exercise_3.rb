# https://docs.ruby-lang.org/en/2.6.0/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments

# When the method defines default arguments you do not need to supply all the arguments to the method. 
#   Ruby will fill in the missing arguments in-order.

# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6)

# solution: [4, 5, 3, 6]