new_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select do |num|
          num.odd?
end

p new_arr