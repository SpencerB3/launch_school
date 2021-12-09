module Validation
  def integer?(value)
    value.to_i.to_s == value
  end

  def invalid_input
    puts "Invalid input. please enter 'y' or 'n' - let's try again..."
  end

  def invalid_choice
    puts "Invalid choice - let's try again..."
  end

  def invalid_entry
    puts "Invalid entry - let's try again..."
  end
end

module Displayable
  def display_welcome_message
    puts "Hello #{human.name} and welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    clear
    puts "Thanks for playing Tic Tac Toe- Goodbye!"
    sleep(2)
    clear
  end

  def clear
    system 'clear'
  end

  def display_play_again_message
    puts  "Let's play again"
    puts ""
  end

  def joinor(array, delimiter=", ", word='or')
    case array.size
    when 0 then array
    when 1 then array.first
    when 2 then array.join(" #{word} ")
    else
      array[-1] = "#{word} #{array.last}"
      array.join(delimiter)
    end
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def draw
    puts <<-HEREDOC
          |     |
       #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}
          |     |
    ------+-----+-----
          |     |
       #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}
          |     |
    ------+-----+-----
          |     |
       #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}
          |     |
    HEREDOC
  end

  def space_five_empty?
    @squares[5].unmarked?
  end

  def computer_optimal_square(marker)
    square = nil
    WINNING_LINES.each do |line|
      square = find_optimal_square(line, marker)
      break if square
    end
    square
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def find_optimal_square(line, marker)
    if @squares.values_at(*line).collect(&:marker).count(marker) == 2
      return @squares.select { |k, v| line.include?(k) && v.marker == ' ' }
                     .keys.first
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker

  def initialize
    set_name
  end
end

class Human < Player
  include Displayable
  include Validation

  def set_name
    clear
    n = nil
    loop do
      print "Please enter your name: "
      n = gets.chomp.strip
      break unless n.empty? || Computer::COMPUTER_NAMES.map(&:upcase)
                                                       .include?(n.upcase)
      invalid_name(n)
    end
    self.name = n
  end

  def invalid_name(name)
    if Computer::COMPUTER_NAMES.map(&:upcase).include?(name.upcase)
      puts "Looks like #{name} is already taken!  Let's try again..."
    else
      invalid_entry
    end
  end

  def set_marker
    choice = nil
    loop do
      puts "Please choose a single character marker."
      puts "Your marker must be one character long and cannot be " \
           "'#{Computer::COMPUTER_MARKER}'"
      choice = gets.chomp.strip
      break if valid_marker?(choice)
      invalid_marker(choice)
      puts ""
    end

    @marker = choice
  end

  private

  def valid_marker?(choice)
    choice.size == 1 && choice != 'O'
  end

  def invalid_marker(marker)
    if marker == 'O'
      puts "#{marker} is already taken - let's try again..."
    else
      invalid_entry
    end
  end
end

class Computer < Player
  COMPUTER_MARKER = 'O'
  COMPUTER_NAMES = %w(R2D2 Chappie Hal Johnny_5).freeze

  def set_name
    self.name = COMPUTER_NAMES.sample
  end

  def set_marker
    @marker = COMPUTER_MARKER
  end
end

class Score
  WINS_FOR_MATCH = 3

  attr_accessor :score
  attr_reader :human_name, :computer_name

  def initialize(human_name, computer_name)
    @human_name = human_name
    @computer_name = computer_name
    reset
  end

  def reset
    @score = { human_name => 0, computer_name => 0 }
  end

  def winner?
    score.values.include?(WINS_FOR_MATCH)
  end

  def find_winner(player)
    score[player] == WINS_FOR_MATCH
  end

  def display
    "SCORE #{human_name}: #{score[human_name]}  #{computer_name}: " \
    "#{score[computer_name]}"
  end

  def update(player)
    score[player] += 1
  end
end

class TTTGame
  include Displayable
  include Validation
  CENTER_SPACE = 5

  attr_reader :board, :human, :computer, :score

  def initialize
    clear
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @score = Score.new(human.name, computer.name)
  end

  def play
    clear
    display_welcome_message
    players_set_markers
    choose_first_mover
    main_game
    display_goodbye_message
  end

  private

  def players_set_markers
    human.set_marker
    computer.set_marker
  end

  def choose_first_mover
    choice = nil

    loop do
      puts "Would you like to have the first move? (y/n)"
      choice = gets.chomp.downcase
      break if %w(y yes n no).include?(choice)
      invalid_input
    end

    first_to_move(choice)
  end

  def first_to_move(choice)
    @current_marker = choice.start_with?('y') ? human.marker : computer.marker
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      clear_screen_and_display_board
      player_move
      display_result
      update_score
      declare_winner if match_winner?
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def match_winner?
    score.winner?
  end

  def declare_winner
    [human.name, computer.name].each do |player|
      puts "#{player} has won the match!!!" if score.find_winner(player)
    end

    reset_scores
  end

  def reset_scores
    score.reset
  end

  def display_board
    puts "First Player to Win #{Score::WINS_FOR_MATCH} Rounds Wins the Match"
    puts score.display
    puts "#{human.name} is an '#{human.marker}'. #{computer.name} is an " \
         "'#{computer.marker}''."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    square = nil
    loop do
      puts "Choose a square: #{(joinor(board.unmarked_keys))}"
      square = gets.chomp
      break if board.unmarked_keys.include?(square.to_i) && integer?(square)
      invalid_choice
    end

    board[square.to_i] = human.marker
  end

  def computer_moves
    square = computer_offense_move
    square = computer_defense_move(square)
    square = CENTER_SPACE if board.space_five_empty?
    square = board.unmarked_keys.to_a.sample if !square
    board[square] = computer.marker
  end

  def computer_offense_move
    board.computer_optimal_square(computer.marker)
  end

  def computer_defense_move(square)
    board.computer_optimal_square(human.marker) if !square
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker     then puts "#{human.name} won!"
    when computer.marker  then puts "#{computer.name} won!"
    else                       puts "The board is full - a tie!"
    end
  end

  def update_score
    case board.winning_marker
    when human.marker    then score.update(human.name)
    when computer.marker then score.update(computer.name)
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n yes no).include?(answer)
      puts "Sorry, just use y or n"
    end

    answer == 'y' || answer == 'yes'
  end

  def reset
    board.reset
    @current_marker = choose_first_mover
    clear
  end

  def current_player_moves
    if human_turn?
      human_moves
    else
      computer_moves
    end
    @current_marker = alternate_player
  end

  def alternate_player
    @current_marker == human.marker ? computer.marker : human.marker
  end

  def human_turn?
    @current_marker == human.marker
  end
end

game = TTTGame.new
game.play
