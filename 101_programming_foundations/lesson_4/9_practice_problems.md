#### Practice Problem 1

What is the return value of the `select` method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

 `[1, 2, 3]`

The `select` method evaluates the return value of the last line of the block, in this case `'hi'`, which then gets evaluated by `select`.  Whatever value is 'truthy' is included in the return value. Because `'hi'` is 'truthy', i.e. not `false` nor `nil`,  the return value is also always truthy, and therefore the elements `[1, 2, 3]`w ill all be returned.



#### Practice Problem 2

How does `count` treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

 `Count`counts the number of elements that return a `true` value when passed through the block.


#### Practice Problem 3

What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

`[1, 2, 3]`.   Since the block evaluates to `nil`, a falsey value, any element that is falsey will be removed by the `reject` method.  No elements in the array are falsey, therefore all elements remain and are included in the return value.



#### Practice Problem 4

What is the return value of `each_with_object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

`{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`  

`Value` is the parameter name the current element (all strings), and `hash` is the parameter name for the method argument (initialized to a `{}` here) which will be returned by the method after the method has finished iterating over each element.  In this method, we set and return the first letter of each string in the array as a key, and the value of the key is the fullname of the string.



#### Practice Problem 5

What does `shift` do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

`shift` destructively mutates the hash by removing the first key/value pair.  The removed key/value pair is returned as a two-item array ``

`hash.shift # => [a:, 'ant']`



#### Practice Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

`11` 

The method `pop` destructively removes the last element from the array and returns that same element (here returning `catepillar`).  The return value of the `size` method on `catepillar` will be `11`.



#### Practice Problem 7

What is the **block**'s return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

`1`

The block's return value will be the evalution of the last expression found in the block.  In this case, the block's last expression is `Fixnum#odd?` which will return a boolean value of `true`. Because the `Array#any?` only needs to return a one instance of a value that is not `false` or `nil` to return `true`, the method iterates only once before stopping.  The return value of `any?` is `true` and the output to the terminal is `1`. 



#### Practice Problem 8

How does take work? Is it destructive? How can we find out?

```Ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

The `Array#take` return the first `n` elements of the array upon which it is called.  The method is not destructive and returns a new array.  The result of `p arr` after the two expressions above would print `[1, 2, 3, 4, 5]` to the consol.



####Practice Problem 9

What is the return value of map in the following code? Why?

```Ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

`{ nil, b: 'bear' }`
The `Array#map` method initializes a new array which is populated with the results of evaluating each element of the collection against the last expression in the block.  In this case, the `if` statement asks if `value.size > 3` evaluates to `true`, and if so returns `value`.  In the first element evaluated, `ant`, the condition is not met and the return value is therefore `nil`.



####Practice Problem 10

What is the return value of the following code? Why?

```Ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

`[1, nil, nil`
For the first iteration of the `map` method, the `if` statement evaluates to `false` and therefore the last expression in the block returns `value`, i.e. `1`.  For the last two iterations, the `if` statement evaluates to `true`, and therefore the block itself evaluates to `nil` since the expression `puts num` does not return a value.  



