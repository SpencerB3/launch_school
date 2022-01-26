def set_raptors(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)

set_raptors(birds) do |_, _, *raptors|
  puts "#{raptors.join(', ')}"
end
