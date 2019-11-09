# Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1 - What is `!=` and where should you use it?

  `!=` means 'not equal' and it is commonly used in conditional statements

2 - Put `!` before something, like `!username`

  `!` operates as a 'bang' operator and flips the boolean value of the object

3 - Put `!` after something, like `words.uniq!`

  In this case, `!` added to the end of the `uniq` method causes the `words` object
  to be mutated.

4 - Put `?` before something

  A question mark `?` before something may trigger a ternary operator.  An example:
    
  `1 + 2 == 3 ? true : false`

5 - Put `?` after something

  When a question mark `?` follows a method, it illustrates that the method will
  return a boolean value

  ```Ruby
  arr = []
  arr.empty?
  # => true
  ```

6 - Put `!!` before something, like `user_name`

  The double bang `!!` turns the object into its boolean equivalent

  ```Ruby
  arr = []
  p !!arr
  # => true
  ```
  