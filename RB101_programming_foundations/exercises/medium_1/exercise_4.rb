# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

def make_lights_hash(lights)
  light_hash = Hash.new
  1.upto(lights) { |light_number| light_hash[light_number] = 'off' }
  light_hash
end

def collect_on_lights(hash)
  hash.select { |_, condition| condition == 'on' }.keys
end
  
def flip_every_nth_switch(hash, nth)
  hash.each do |position, state|
    if position % nth == 0
      hash[position] = (state == 'off') ? 'on' : 'off'
    end
  end
end

def flip_switch(rounds)
  lights = make_lights_hash(rounds)
  1.upto(lights.size) do |round|
    flip_every_nth_switch(lights, round)
  end
  collect_on_lights(lights)
end

flip_switch(5) # => [1, 4]
