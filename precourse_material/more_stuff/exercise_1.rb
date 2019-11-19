# "laboratory"
# "experiment"
# "Pans Labyrinth"
# "elaborate"
# "polar bear"

def has_lab?(word)
   # if word =~ /lab/
  if /lab/.match(word)
    puts "We have a match!"
  else
    puts "No match!"
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")