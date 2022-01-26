items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *produce, wheat |
  puts produce.join(', ')
  puts wheat
end

gather(items) do | apples, *produce, wheat |
  puts apples
  puts produce.join(', ')
  puts wheat
end

gather(items) do | apple, *produce |
  puts apple
  puts produce.join(', ')
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
end
