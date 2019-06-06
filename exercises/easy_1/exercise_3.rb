def digit_list(number)
	str_array = number.to_s.split("")
	num_array = str_array.map do |number|
		number.to_i
	end
	return num_array
	# num_array.each do |num|
	# 	puts num
	# end
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4] 