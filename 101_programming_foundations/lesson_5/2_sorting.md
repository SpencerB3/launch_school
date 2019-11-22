## Sorting 5.2

#### 1
Without running the code, try to figure out what would be returned here:

`['arc', 'bat', 'cape', 'ants', 'cap'].sort`

`# => ["ants", "arc", "bat", "cap", "cape"]`

`String#<=>` compares multi-character strings by character.  If the first character is the same, the the next characters are compared.  When the comparable characters are all equal, as in `cap` and `cape`, `cape` will be considered greater as it has a longer length.

#### 2
See if you can work out what would be returned when sort is called on this array of arrays:

`[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort`

`[['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]`

The Array#sort method will compared the first elements in each nested array, and then ifthe comparable elements are equal, the method will compare by length, the longer being greater.