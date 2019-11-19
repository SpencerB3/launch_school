# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(starting_value, ending_value)
  result = []
  starting_value.upto(ending_value) do |num|
    result << fizzbuzz_value(num)
  end
  puts result.join(', ')
end

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0 then 'FizzBuzz'
  when num % 3 == 0 then 'Fizz'
  when num % 5 == 0 then 'Buzz'
  else num
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
