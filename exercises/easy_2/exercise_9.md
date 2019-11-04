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

The upcase! method is a destructive method that will modify the reference in memory 
thus affecting the original object to which the two varibles 'name' aand 'save_name' 
point towards.
