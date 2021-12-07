module Displayable
  def welcome_display
    clear
    display_welcome_message
    sleep(3)
    clear
  end

  def display_welcome_message
    puts "Welcome #{human.name} to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    clear
    puts "Thank you for playing Rock, Paper, Scissors, Lizard, Spock - Goodbye!"
  end

  def display_rules_and_score
    display_games_to_win_match
    display_score
  end

  def display_games_to_win_match
    puts "First player to win #{RPSGame::WINS_FOR_MATCH} rounds is crowned the winner!"
  end

  def display_score
    puts "#{human.name}: #{human.score} -- #{computer.name}: #{computer.score}"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human_won?
      puts "#{human.name} won!"
      human.score += 1
    elsif computer_won?
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_history?
    puts "Type 'h' to display history, or type any other key to continue"
    print_history if gets.chomp.downcase == 'h'
    clear
  end
end

class Player
  VALID_CHOICES = %w(r p s l v).freeze
  COMPUTER_NAMES = %w(R2D2 Chappie Hal).freeze

  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end
end

class Human < Player
  CHOOSE_HAND = <<~MSG
    Please enter one of the following five choices:
    ->  'r' for rock
    ->  'p' for paper
    ->  's' for scissors
    ->  'l' for lizard
    ->  'v' for spock
  MSG

  def choose
    choice = nil
    loop do
      puts CHOOSE_HAND
      choice = gets.chomp.downcase.to_sym
      break if RPSGame::MOVES.keys.include?(choice)
      puts "Invalid entry - let's try again..."
    end
    self.move = RPSGame::MOVES[choice.to_sym]
  end

  def set_name
    n = ""
    loop do
      print "Please enter your name: "
      n = gets.chomp.strip
      break unless n.empty? || COMPUTER_NAMES.include?(n)
      invalid_name(name)
    end
    self.name = n
  end

  def invalid_name(name)
    if COMPUTER_NAMES.include?(name)
      puts "Looks like #{name} is already taken!  Let's try again..."
    else
      puts "Invalid entry - Let's try again..."
    end
  end
end

class Computer < Player
  GAME_HANDS = { 'R2D2' => %w(s p p p l l l v v v),
                 'Chappie' => %w(s p p p l l l v v v),
                 'Hal' => %w(s s s s s r l v) }.freeze

  def choose
    self.move = RPSGame::MOVES[(GAME_HANDS[name].sample).to_sym]
  end

  def set_name
    self.name = COMPUTER_NAMES.sample
  end
end

class Move
  attr_reader :move, :wins_against, :value

  def >(other_move)
    wins_against.include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
    @wins_against = %w(scissors lizard)
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @wins_against = %w(rock spock)
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @wins_against = %w(paper lizard)
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @wins_against = %w(paper spock)
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @wins_against = %w(rock scissors)
  end
end

# --------- Orchestration engine ----------------

class RPSGame
  include Displayable
  WINS_FOR_MATCH = 3

  rock = Rock.new
  paper = Paper.new
  scissors = Scissors.new
  lizard = Lizard.new
  spock = Spock.new

  MOVES = { r: rock, p: paper, s: scissors, l: lizard, v: spock }

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    welcome_display

    loop do
      display_rules_and_score
      players_choose
      store_move
      game_display
      break unless play_again?
      clear
    end

    display_goodbye_message
  end

  private

  def players_choose
    human.choose
    computer.choose
  end

  def game_display
    display_moves
    display_winner
    display_score
    someone_won?
    display_history?
  end

  def human_won?
    human.move > computer.move
  end

  def computer_won?
    computer.move > human.move
  end

  def store_move
    human.history << human.move
    computer.history << computer.move
  end

  def print_history
    clear
    human_history
    computer_history

    puts "", "Hit enter to continue"
    gets
    clear
  end

  def human_history
    puts "#{human.name}'s moves so far:"
    human.history.each_with_index do |move, idx|
      puts "Round #{idx + 1}: #{move}"
    end
  end

  def computer_history
    puts "", "#{computer.name}'s moves so far:"
    computer.history.each_with_index do |move, idx|
      puts "Round #{idx + 1}: #{move}"
    end
  end

  def someone_won?
    if human.score == WINS_FOR_MATCH
      puts "Congrats - #{human.name} won the match- You are crowned champion!"
      reset_scores
    elsif computer.score == WINS_FOR_MATCH
      puts "#{computer.name} won the match!"
      reset_scores
    end
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play another round? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y yes n no).include?(answer)
      puts "Please only type 'y' or 'n'/  Let's try again..."
    end

    answer == 'y' || answer == 'yes'
  end

  def clear
    system 'clear'
  end
end

RPSGame.new.play
