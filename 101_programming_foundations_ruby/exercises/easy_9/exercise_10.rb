# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# Algo: 3D array -> array
# - initialize array

def buy_fruit(list)
  expanded_list = []
  list = list.flatten
  i = 0
  while i < list.size
    expanded_list << [list[i]] * list[i + 1]
    i += 2
  end
  expanded_list.flatten
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
