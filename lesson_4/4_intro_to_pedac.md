## PROBLEM: ##

Given a string, write a method `palindrome_substrings` which returns # all the substrings from a given string which are palindromes. Consider # palindrome words case sensitive. 



## TestCases:

```Ruby
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]  palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"] palindrome_substrings("palindrome") == [] 
palindrome_substrings("") == []
```



```Ruby
# Some questions you might have?
# 1. What is a substring?
# 2. What is a palindrome?
# 3. Will inputs always be strings?
# 4. What does it mean to treat palindrome words case-sensitively?

# input: string
# output: an array of substrings
# rules:
#      Explicit requirements:
#        - return only substrings which are palindromes.
#        - palindrome words should be case sensitive, meaning "abBA"
#          is not a palindrome.
```



