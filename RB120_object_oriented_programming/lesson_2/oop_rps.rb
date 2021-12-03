class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      print "Please choose rock, paper, or scissors: "
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Invalid entry - let's try again..."
    end
    self.move = Move.new(choice)
  end

  def set_name
    n = ""
    loop do
      print "Please enter your name: "
      n = gets.chomp
      break unless n.empty?
      puts " Invalid entry - Let's try again..."
    end
    self.name = n
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = ['R2D2', 'Chappie', 'Hal', 'Sonny', 'Number 5'].sample
  end
end

class Move
  VALUES = %w(rock paper scissors).freeze

  attr_reader :value

  attr_reader :move

  def initialize(value)
    @value = value
  end

  def scissors?
    value == 'scissors'
  end

  def paper?
    value == 'paper'
  end

  def rock?
    value == 'rock'
  end

  def >(other)
    (rock? && other.scissors?) ||
      (paper? && other.rock?) ||
      (scissors? && other.paper?)
  end

  def <(other)
    (scissors? && other.rock?) ||
      (rock? && other.paper?) ||
      (paper? && other.scissors?)
  end

  def to_s
    value
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors - Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y yes n no).include?(answer)
      puts "Please only type 'y' or 'n'/  Let's try again..."
    end

    answer == 'y' || answer == 'yes'
  end
end

RPSGame.new.play
