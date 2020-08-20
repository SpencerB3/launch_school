### 5.4 Working with Callback Functions

#### Example 3

```javascript
[[1, 2], [3, 4]].map(arr => {
  console.log(arr[0]);
  return arr[0];
});

1
3
=> [1, 3]
```

| Action                      | Performed On                         | Side Effect                                    | Return Value                      | Is Return Value Used?                         |
| --------------------------- | ------------------------------------ | ---------------------------------------------- | --------------------------------- | --------------------------------------------- |
| method call (map)           | Outer array                          | None                                           | new array `[1, 3]`                | No                                            |
| callback execution          | Each sub-array                       | None                                           | element access of arr[0]          | yes, by `map` method                          |
| element access `([0])`      | each sub-array                       | None                                           | element at index `0` of sub-array | Yes, by `console.log`                         |
| method call `(console.log)` | element at index 0 of each sub-array | outputs a string representation to the console | `undefined`                       | no                                            |
| element access `([0])`      | Each sub-array                       | None                                           | element at index `0` of sub-array | Yes, explicitly returned to callback function |



#### Example 4

```javascript
let myArr = [[18, 7], [3, 12]].forEach(arr => {
  return arr.map(num => {
    if (num > 5) {
      return console.log(num);
    }
  });
});

18
7
12
undefined
```

| Action                                             | Performed On                                 | Side Effect                                | Return Value               | Is Return Value Used?                             |
| -------------------------------------------------- | -------------------------------------------- | ------------------------------------------ | -------------------------- | ------------------------------------------------- |
| variable declaration and assignment operator `(=)` | n/a                                          | none                                       | `undefined`                | No                                                |
| method call  (`forEach`)                           | outer array                                  | None                                       | `undefined`                | Yes, by assignment operator `(=)` to `myArr`      |
| outer callback execution                           | each sub-array                               | none                                       | [`undefined`, `undefined`] | No                                                |
| inner method call `(map)`                          | Sub-array                                    | None                                       | [`undefined`, `undefined`] | Yes, used as return value for the callback method |
| Callback execution                                 | each element of sub-array in that iteration  | None                                       | `undefined`                | Yes, by `map` method call                         |
| comparison operator `(>)`                          | each element of sub-array in that  iteration | None                                       | boolean                    | Yes, by `if` statement                            |
| method call `(console.log)`                        | Each element of sub-array in that iteration  | outputs a string representation of element | `undefined`                | Yes, used by `map` method call                    |



#### Example 5

```javascript
[[1, 2], [3, 4]].map(arr => {
  return arr.map(num => num * 2);
});

[ [ 2, 4 ], [ 6, 8 ] ]
```



| Action                        | Performed On                                | Side Effect | Return Value                 | Is Return Value Used?                    |
| ----------------------------- | ------------------------------------------- | ----------- | ---------------------------- | ---------------------------------------- |
| method call `(map)`           | outer array                                 | None        | new array `[[2, 4], [6, 8]]` | no                                       |
| callback execution            | each sub-array                              | None        | new sub-array                | Yes, by `map` method                     |
| inner method call `(map)`     | each sub-array                              | None        | new sub-array                | Yes, returned by callback function       |
| inner callback execution      | each element of sub-array in that iteration | None        | number                       | Yes, by inner `map` function             |
| multiplication operator `(*)` | each element of sub-array in that iteration | None        | number                       | Yes, returned by inner callback function |



#### Example 6

```javascript
[{ a: 'ant', b: 'elephant' }, { c: 'cat', d: 'dog' }].filter(object => {
  return Object.keys(object).every(key => object[key][0] === key);
});

// => [ { c: 'cat', d: 'dog' } ]
```

| Action                      | Performed On          | Side Effect | Return Value                           | Is Return Value Used?              |
| --------------------------- | --------------------- | ----------- | -------------------------------------- | ---------------------------------- |
| method call `(filter)`      | outer array           | None        | new array `[ { c: 'cat', d: 'dog' } ]` | no                                 |
| callback execution          | each element (object) | none        | boolean                                | Yes, by `filter` method -          |
| method call `(Object.keys)` | each object           | none        | array                                  | yes, by `every` method             |
| Method call `(every)`       | array                 | none        | boolean                                | Yes, returned by callback function |



#### Example 7

```javascript
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map(arr => {
  return arr.filter(item => {
    if (typeof item === 'number') {    // if it's a number
      return item > 13;
    } else {
      return item.length < 6;
    }
  });
});
// => [ [ 27 ], [ 'apple' ] ]
```

| Action                           | Performed On                                        | Side Effect | Return Value  | Is Return Value Used?              |
| -------------------------------- | --------------------------------------------------- | ----------- | ------------- | ---------------------------------- |
| method call `(map)`              | outer array                                         | None        | new array     | no                                 |
| callback execution               | each sub-array                                      | none        | new sub-array | Yes, by outer `map` method         |
| inner method call `(filter)`     | each sub-array                                      | None        | new sub-array | Yes, by callback function          |
| callback execution               | each element of each sub-array in that iteration    | none        | boolean       | Yes, by `filter` method            |
| strict equality operator `(===)` | each element of each sub-array in that iteration    | none        | boolean       | Yes, by `if` statement             |
| `typeof` operator                | each element of each sub-array in that iteration    | none        | string        | Yes, by strick equality operator   |
| comparison operator `(>)`        | elements which gave `true` in above `if` statement  | none        | Boolean       | yes, returned by callback function |
| length property                  | elements which gave `false` in above `if` statement | none        | number        | Yes, by comparison operator `(<)`  |
| comparison operator `(<)`        | elements which gave `false` in above `if` statement | none        | boolean       | Yes, returned by callback function |



#### Example 8

```javascript
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map(element1 => {
  return element1.forEach(element2 => {
    return element2.filter(element3 => {
      return element3.length > 0;
    });
  });
});

// => [ undefined, undefined ]
```

| Action                    | Performed On                                              | Side Effect | Return Value            | Is Return Value Used?                              |
| ------------------------- | --------------------------------------------------------- | ----------- | ----------------------- | -------------------------------------------------- |
| method call `(map)`       | outer array                                               | none        | new array               | no                                                 |
| callback execution        | each sub-array                                            | none        | new sub-array           | Yes, by `map` method call                          |
| method call `(forEach)`   | sub-array                                                 | none        | `undefined`             | Yes, returned by callback function                 |
| callback execution        | 2nd level sub-array                                       | none        | new sub-array           | no                                                 |
| method call `(filter)`    | element in 2nd level sub-array in that iteration (number) | none        | new 2nd level sub-array | yes, returned by the above level callback function |
| callback execution        | element in 2nd level sub-array in that iteration (number) | none        | boolean                 | Yes, by `filter` method                            |
| comparison operator `(>)` | n/a                                                       | none        | boolean                 | Yes, returned by callback method                   |



#### Example 9

```javascript
[[[1, 2], [3, 4]], [5, 6]].map(arr => {
  return arr.map(elem => {
    if (typeof elem === 'number') { // it's a number
      return elem + 1;
    } else {                  // it's an array
      return elem.map(number => number + 1);
    }
  });
});

// => [[[2, 3], [4, 5]], [6, 7]]
```

| Action                         | Performed On                  | Side Effect | Return Value                     | Is Return Value Used?                        |
| ------------------------------ | ----------------------------- | ----------- | -------------------------------- | -------------------------------------------- |
| method call `(map)`            | outer array                   | none        | new array                        | no                                           |
| callback execution             | sub-array                     | none        | new sub-array                    | Yes, by top level `map` method               |
| method call `(map)`            | sub-array                     | none        | new sub-array                    | Yes, by upper level callback function        |
| callback execution             | number or 2nd level sub-array | none        | number or new 2nd level sub-aray | yes, by 2nd level `map` function             |
| strict equality operator `===` | number or 2nd level sub-array | none        | boolean                          | yes, by `if` statement                       |
| `typeof` operator              | number or 2nd level sub-array | none        | string                           | Yes, by strict equality operator             |
| addition operator `(+)`        | number                        | none        | new number                       | yes, returned by 2nd level callback function |
| method call `(map)`            | 2nd level sub-array           | none        | new 2nd level sub-array          | yes, returned by 2nd level callback function |
| callback execution             | number                        | none        | new 2nd level sub-array          | Yes, by closest level  `map` function        |
| addition operator `(+)`        | number                        | none        | new number                       | Yes, returned by callback function           |

