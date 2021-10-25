require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_FOR_MATCH = 5
WAITING_TIME = 3

first = ''
current = ''

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  prompt "Let's play Tic Tac Toe!"
  prompt "First to #{WINS_FOR_MATCH} rounds wins the match"
end

def player_first(first)
  prompt "Do you want to play first?  Type y or n"
  answer = gets.downcase.chomp

  loop do
    if answer.start_with?('y')
      first << 'player'
      break
    elsif answer.start_with?('n')
      first << 'computer'
      break
    else
      prompt "That is not a valid answer. Please type y or n:"
      answer = gets.downcase.chomp
    end
  end
end

def alternate_player(current)
  current == 'player' ? 'computer' : 'player'
end

def place_piece!(brd, current)
  current == 'player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

# rubocop: disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, player_score, computer_score)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts "Score: Player:#{player_score} - Computer:#{computer_score}"
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----|-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----|-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop: enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}

  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt 'Sorry, that is not a valid choice'
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = computer_optimal_square(brd, COMPUTER_MARKER)
  square = computer_optimal_square(brd, PLAYER_MARKER) if !square
  square = 5 if brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARKER
end

def computer_optimal_square(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_optimal_square(line, brd, marker)
    break if square
  end
  square
end

def find_optimal_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    return board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys
                .first
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimiter=", ", word='or')
  case arr.size
  when 0 then ""
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr[-1]}"
    arr.join(delimiter)
  end
end

def match_ended?(score1, score2)
  score1 == WINS_FOR_MATCH || score2 == WINS_FOR_MATCH
end

def announce_winner(player_score)
  if player_score == WINS_FOR_MATCH
    prompt "CONGRATS - YOU WON THE MATCH!"
  else
    prompt "THE COMPUTER HAS WON THE MATCH"
  end
end

# main code -------------------------------------------
system 'clear'

loop do
  welcome

  player_first(first)

  current = first

  player_score = 0
  computer_score = 0
  sleep WAITING_TIME

  loop do
    board = initialize_board

    loop do
      display_board(board, player_score, computer_score)
      place_piece!(board, current)
      current = alternate_player(current)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      sleep WAITING_TIME
      detect_winner(board) == 'Player' ? player_score += 1 : computer_score += 1
    else
      prompt "It's a tie!"
      sleep WAITING_TIME
    end

    current = first

    break if match_ended?(player_score, computer_score)
  end

  announce_winner(player_score)
  prompt 'Play again? (y or n)'

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for playing Tic Tac Toe! Good bye!'
