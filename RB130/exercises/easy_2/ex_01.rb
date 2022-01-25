def step(first_num, last_num, increment)
  value = first_num

  while value <= last_num
    yield(value)
    value += increment
  end

  value
end

step(1, 10, 3) { |value| puts "value = #{value}" }
