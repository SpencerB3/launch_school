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