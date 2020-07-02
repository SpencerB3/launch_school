# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

def bubble_sort!(array)
  loop do
    swap = false
    array.each_with_index do |num, idx|
      break if num == array[-1]
      if num > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        swap = true
      end
    end
    break if swap == false
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
