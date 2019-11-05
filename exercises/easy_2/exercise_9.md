**What does this print out? Can you explain these results?**

```Ruby
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

The result:

```Ruby
BOB
BOB
```

The upcase! method is a destructive method that will modify the String object 
referenced by 'name' which is the same String object referenced by 'save_name'
