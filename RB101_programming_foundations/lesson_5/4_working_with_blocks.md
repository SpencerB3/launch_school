## 5.4 Working with Blocks

### Example 1

What's happening in this, seemingly simple, piece of code? Take it apart and try to describe every interaction with precision.

```Ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

In this example the `each` method iterates through the array, treating each nested array as one element.  Each element is then assigned to the variable `arr`.  When the method `arr.first` is called upon each element, `arr.first` will return the element at index `0 `of each nested array. The `puts` method then prints aa string version of the integer to the consol. The `puts` method then returns `nil` which goes unused by `each`.  `Each` will finally return the calling object `[[1, 2], [3, 4]]`.

### Example 3

Let's mix it up a little bit and have you try taking apart an example on your own.

```Ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

Result:

```Ruby
1
3
=> [1, 3]
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
1|method call (map)|outer array| none | new array [1, 3] | no|	
1-4|block execution|each nested array|none|integer at index 0|yes, returned by `map`|
2|method call(first)|each nested array|none| element at index[0]| yes, used by `puts`|
2|method call(puts)|integer at index 0 of each nested array|outputs object as string to consol|`nil`|No|
3|method call(first)|each nested array|none| element at index 0| yes, becomes return value of block|

## Example 4
Here's another example. What will be output and what will be the value of my_arr?

```Ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

Result:

```Ruby
18
7
12
=> [[18, 7], [3, 12]]
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
1|variable assignment|n/a|none|`[[18, 7], [3, 12]]`|no|
1|(`each`) method call|`[[18, 7], [3, 12]]`|none|calling object|assigned to my_arr|
1-7|outer block execution|each sub-array|each sub-array|no|
2|(`each`) method call|each sub-arr|none|sub-array|no|
2-6|inner block execution|arr(sub-array)|none|`nil`|no|
3|`>` comparison|element of the sub-array in that iteration|none|Boolean|yes, evaluated by `if`
3-5|`if` conditional statement|`num`(sub-array elements)|none|nil| used to determine inner value of block|
4|(`puts` method call)|element of the sub-array in that iteration|output string representation of integer to consol|`nil`|return value of block|

## Example 5
What will the return value be in this example?

```Ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

Result:
`=> [[2, 4],[6, 8]]`

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
|1|method call `map`|`[[1, 2], [3, 4]]` original array|none| new array | no |
|1-5| outer block execution| none | new array |return value of inner `map` method|  yes, used by first-level `map` method for transformation |
|2| method call `map`| each sub-array at its iteration|none|new array| yes, used to determine outer block method |
|2-4|inner block execution|each element within sub-array at that iteration|integer |yes, by inner `map` method|
|3| `*` operator | n/a | none | integer | yes, gives return value of block

## Example 6
In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.

```Ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

 | Line | Action | Object | Side Effect | Return Value |Is Return Value Used?
---  | -----  | ------ | ----------  | ------------ | --------------------- | --------------------- 
|1|method call (`select`)|array containing two hashes|none|new array| no, outputed at last line
|1-5| block execution | each hash contained in original array at that iteration| none | if element is evaluated to a truthy value| yes, by `select` method
|2|method call `all?`|each hash at that iteration|none| 1st iteration: falsey, 2nd iteration: truthy| yes, by `select` method
|3|method call (`to_s`)|`key` parameter, key in hash|none| Symbol object is turned to String object| yes, by `==` operator
|3|`==` equality comparison|values of value[0] and key.to_s|none|Boolean|yes, by `all?` method
|3|`[]` method call| value parameter, a String|none|value of first index of String| yes, by `==` equality comparison

## Example 7

```Ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
|2|method call (`sort_by`)|arr|none|[["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]| no, but printed on last line
|2-6|block execution|each sub-array at that iteration|none|return value of inner `map` method|yes, by top-level `sort_by` method
|3|method call (`map`)|each sub-array at that iteration|none|new Array(sub-array)|yes, gives outer block its return value|
|3-5|inner block execution|the elements inside of each sub-array at that iteration|none|array of integers|yes, by inner `map` method|
|4|method call (`to_i`)|each String element in each sub-array|none|an integer|yes, determines value of inner block

## Example 8

```Ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
1|method call (`map`)|outer array|none|new Array|no, put printed at last line
1-9|block execution|each sub-array|none|gives return value of `select` method|yes, by top level `map` method
2|method call (`select`)|each sub-array at its iteration|none|new Array|yes, gives outer block its return value
2-8|inner block execution|each sub-array at its execution|none|an integer above the value of 13 or a string below the length of six indices|yes, used by `select method` for selection
3-7|`if/else` conditional statement| element in the sub-array at its iteration|none|`nil`|Yes, used to determine return value of block
3|`==` equality comparison|element of the sub-array in that iteration|none|Boolean| yes, evaluated by `if`
3|method call `to_s`|each element of the sub-array in that iteration|none|returns a string representation of element|yes, used by `to_i` method
3|method call `to_i`|each element of the sub-array in that iteration, transformed by to_s|none|an integer|yes, used by `==` equality comparison
4|comparison operator `>`|element of the sub-array evaluated to `true` in above `if` conditional statement|none|Boolean|yes, used to determine the value of the inner block
6|comparison operator `<`|element of the sub-array not evaluated to `true` in above `if` statement|none|Boolean|yes, usedto determine the value of the inner block

## Example 9

```Ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
1|method call (`map`)| outer array|none|new array with the same values as the original outer array|no, though outputed at the last line
1-7|block execution| sub-array of outer array|none|original sub-arrays|yes, by `map` method to perform transformation
2|method call (`each`)|sub-array at that iteration|none|the original sub-array|yes, used to determine the value of the outer block
2-6|middle block execution|each sub-array element(array)|none|two arrays|no
3|method call (`partition`)|each sub-array element(array)|none|two arrays, true_array and false_array|yes, used to define the value of the middle block
3-5|inner block execution|each object inside the array inside the sub-array|none|Boolean|yes, by `partition` method to perform selection
4|comparison operator `>`|each object inside the array inside the sub-array|none|Boolean| yes, to determine inner block's return value
4|method call `size`|each object inside the array inside the sub-array|none|integer| yes, used by `>` operator


## Example 10

```Ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
# => [[[2, 3], [4, 5]], [6, 7]]
```

Line | Action | Object | Side Effect | Return Value | Is Return Value Used? |
---  | -----  | ------ | ----------  | ------------ | --------------------- |
1|method call (`map`)|outer array|none| new array [[[2, 3], [4, 5]], [6, 7]]| no|
1-11|outer block execution|each sub-array|none| return value of inner `map` method (new array)| yes, used by top-level `map` method for transformation| 
2|method call `map`|each sub-array |none| new array | yes, used to determine the outer block's return value
2-10|middle block execution|each element in the sub-array (integer or array)|none| el + 1 if an integer, new array if an array| yes, used by second level `map` method call
3-9|`if/else` conditional statement| element within sub-array|none| Boolean | yes, used to determine middle block's return value
3| `==` equality comparison|element in sub-array|none|Boolean|yes, used by `if/else` statement
3|method call (`to_s`)|element in sub-array|none|string representation of element in sub-array| yes, used by `size`
3|method call `size`|element in sub-array, transformed by `to_s`|none|integer, number of indices in string|yes, used by `==` comparison
4|`+`addition operator|element in sub-array (integer) |none| integer `6` and `7`| yes, used to determine value of middle block
6|method call `map`|element in sub-array (array)|none| new array `[2, 3]` and `[4, 5]`| used by `if/else` statement
6-8|inner block execution|array inside sub-array|none|integer `2`,`3` and `4`, `5`| yes, used by third level `map` to perform transformation
7|`+` addition operator|integer inside array inside sub-array|none|integer `2`,`3` and `4`, `5`| yes, used to determine the inner block's return value
















