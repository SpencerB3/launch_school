VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

WINNING_PLAYS = { 'rock' => ['scissors', 'lizard'], 
                 'paper' => ['rock', 'spock'],
                 'scissors' => ['paper', 'lizard'],
                 'lizard' => ['paper', 'spock'],
                 'spock' => ['scissors', 'rock']
               }

WINNING_NUMBER = 5

def prompt(message)
  puts "=> #{message}"
end

def display_welcome
  prompt <<- MSG
    "Welcome to Rock, Paper, Scissors, Lizard, Spock!  First to win five rounds
    wins the match!"
    MSG
end

def choices
  prompt <<-MSG
    "Please select one of the following:
    - Rock (type 'r')
    - Scissors (type 'sc')
    - Paper (type 'p')
    - Lizard (type 'l')
    - Spock (type 'sp)
    MSG
end

def convert_options(player_choice)
  case player_choice
  when 'ro' then 'rock'
  when 'sc' then 'scissors'
  when 'p' then 'paper'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

def display_choices(player_choice, computer_choice)
  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")
end

def player_win?(player_choice, computer_choice)
  WINNING_PLAYS[player_choice].include?(computer_choice)
end

def computer_win?(computer_choice, player_choice)
  WINNING_PLAYS[computer_choice].include?(player_choice)
end

def display_winner(player_wins, computer_wins)
  if player_wins == WINNING_NUMBER
    puts('Congrats, you won the match!')
  elsif computer_wins == WINNING_NUMBER
    puts('Computer has won!')
  end
end

def match_over?(player_wins, computer_wins)
  player_wins == WINNING_NUMBER || computer_wins == WINNING_NUMBER
end

def play_again?(answer)
  prompt("Do you want top play again?")
  loop do
    answer = gets.chomp.downcase
    if answer.start_with?('y')
      return true
    elsif answer.start_with?('n')
      false
    end
    prompt("Please type 'y or 'n'")
  end
end

def screen_clear
  system('clear') || system)('cls')
end

def goodbye_message
  prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock!")
# main code

loop do
  choice = nil
  loop do
    prompt('Choose one: #{VALID_CHOICES.join(', ')}')
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing! Good bye!')