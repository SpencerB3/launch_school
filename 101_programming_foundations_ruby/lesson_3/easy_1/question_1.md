# Question 1

What would you expect the code below to print out?

```Ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

I expect the code would print out

```Ruby
1
2
3
4
``` 
Two reasons:
* The `uniq` method is non-destructive and did not modify the `numbers` object.
* The method `puts` prints every element on its own line.
