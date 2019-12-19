# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |ele|
  new_hash = {}
  ele.each { |k, v| new_hash[k] = v + 1 }
  new_hash
end
