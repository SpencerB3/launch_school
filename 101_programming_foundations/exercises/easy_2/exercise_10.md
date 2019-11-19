**What will the following code print, and why? Don't run the code until you have tried to answer**

```Ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```

```Ruby
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo
```

Since the each element of array1 that are now in array2 share the same reference
to the same String object, a modification of one changes the other, even if 
array2 were the one modified and array1 printed.
