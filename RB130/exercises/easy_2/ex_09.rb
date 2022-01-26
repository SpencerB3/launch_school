def each_cons(array)
  array.each_with_index do |item, index|
    break if index >= array.size - 1
    yield(item, array[index + 1])
  end

  nil
end

def each_cons(array)
  index = 0

  while index < array.size - 1
    yield(array[index],array[index + 1])
    index += 1
  end

  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}
result == nil
