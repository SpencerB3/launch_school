##Problem 1



Let's now take a look at an example with hashes. In this example we want to select the key-value pairs where the value is `'Fruit'`.

```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```



How would you implement a method like this?



```Ruby
def select_fruit(produce_list)

  selected_fruit = {}
  counter = 0
  produce = produce_list.keys

  loop do
    break if counter == produce.size

    current_key = produce[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruit[current_key] = current_value
    end
    
    counter += 1
  end
  selected_fruit
end
```



## Problem 2

Can you implement a `double_numbers!` method that mutates its argument?



```Ruby
def double_numbers!(numbers)
  counter = 0

  loop do
    numbers[counter] *= 2
    counter += 1
    break if counter == numbers.size
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

```



What if we wanted to transform the numbers based on their position in the array rather than their value?



```Ruby
def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]

```



Try coding a method that allows you to multiply every array item by a specified value:



```Ruby	
def multiply(numbers, multiplier)
  counter = 0
  new_numbers = []

  loop do
    current_number = numbers[counter]
    new_numbers << current_number * multiplier
    counter += 1
    break if counter == numbers.size
  end
  new_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
```



