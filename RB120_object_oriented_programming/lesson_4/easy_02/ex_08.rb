# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game #=> after the class name we put Game so Bingo inherits the Game class.
  def rules_of_play
    #rules of play
  end
end