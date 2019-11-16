# Collections Basic

## String Element Reference

How would you reference 'grass' from within this string? Try it out in irb.

`str = 'The grass is green'`

Solution:

`str[4, 5]`

## Array Element Reference

What do you think would be returned here? Try it out in irb.

```Ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]
```

Solution:

```Ruby
arr[2, 3] # => ['c', 'd', 'e']
arr[2, 3][0] # => 'c'
```

## Hash Element Reference

When initializing a hash, the keys must be unique. Try the following code out in irb.

`hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }`

What happened?

Solution:

```Ruby
(irb):8: warning: key "fruit" is duplicated and overwritten on line 8
=> {"fruit"=>"pear", "vegetable"=>"carrot"}
```

## Negative Indices

What do you think would be returned by the following calls?

```Ruby
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6]
arr[-6]
```

Solution:

```Ruby
str[-6] # => nil
arr[-6] # => nil
```

## Conversion

### String to Array

Try the following code out in irb.

```Ruby
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
```

You'll notice that the original string had spaces in between each word but the final string did not. Why is this? You may want to check the Ruby docs to read up on String#split and Array#join.

Can you think of a couple of ways in which the items in the array could be joined together so that result resembles the original string?

Solution:

```Ruby
arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] + ' ' + arr[5] + ' ' + arr[6]
"#{arr[0] arr[1] arr[2] arr[3] arr[4] arr[5] arr[6]}"
```

### Array to Hash

What do you think would happen if #to_h was called on the following array?

`arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]`

`arr.to_h #=> { :name => "Joe", :age => 10, :favorite_color => "blue" }`

## Element Assignment

### String

```Ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```

Using the same element assignment method, how would you change the first letter of the remaining words in the sentence to their uppercase versions? Try it out in a code file or in irb.

```Ruby
str[6] = 'F
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
str # => # => "Joe's Favorite Color Is Blue"
```

### Array

```Ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```

In irb or a code file use the same method to increase the value of the rest of the integers in the array by 1.

```Ruby
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]
```

## Hash Element Assignment

```Ruby
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
```

In irb or a code file use the same method to set a value of either 'Fruit' or 'Vegetable' to each element in the hash.

```Ruby
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit
hsh[:broccoli] = 'Vegetable'
hsh => hsh # => { :apple => "Fruit", :carrot => "Vegetable", :pear => "Fruit", :broccoli => "Vegetable" }
```
