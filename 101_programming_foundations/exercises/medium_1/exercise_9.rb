# Rewrite your recursive fibonacci method so that it computes its results without recursion.

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

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
