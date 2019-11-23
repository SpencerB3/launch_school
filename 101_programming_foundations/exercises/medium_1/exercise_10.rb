# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci_last(n)
  # fibonacci(n) % 10
  last_2 = [1, 1]
  3.upto(n) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end

def fibonacci(n)
  return 1 if n <= 2
  sum = 0
  first = 1
  second = 1
  n.downto(3) do
    sum = first + second
    first = second
    second = sum
  end
  sum
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789)
