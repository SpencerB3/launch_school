# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

=begin
problem i : n, a number -- o: also a number, result of method run input amount of times
  obs: the first two digits are one, and may count as a break case
        the input number needs to decrease in order to get to the break case
        the result of all these recursive methods needs to be stored to a variable (i think) which then is returned at the break case
        bring the parmeter to 2, adding it aall up in  vaariable

algo: 
  break case if n equals 1 or 2 return 1
  set variable equal to (add n- 1 plus n - 2)
  call fibonacci on the result
=end

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765
