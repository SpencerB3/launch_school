# Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

```Ruby
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
# => [1, 3, 4, 5]
```

```Ruby
numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
# => [2, 3, 4, 5]
```
