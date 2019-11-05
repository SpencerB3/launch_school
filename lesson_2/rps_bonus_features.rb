# fix another calculation?
# go through Juliette code and critique

VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'l' => 'lizard',
                  'v' => 'spock' }

WINNING_HANDS = { 'rock' => %w(scissors lizard),
                  'paper' => %w(rock spock),
                  'scissors' => %w(paper lizard),
                  'lizard' => %w(paper spock),
                  'spock' => %w(rock scissors) }

WIN_MATCH = 5

def prompt(message)
  puts "=> #{message}"
end

def clear
  system('clear') || system('cls')
end

HANDS = <<-MSG
Please enter one of the following five choices:
->  'r' for rock
->  'p' for paper
->  's' for scissors
->  'l' for lizard
->  'v' for spock
MSG

def retrieve_user_choice
  choice = ''
  loop do
    prompt(HANDS)
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice)
      return VALID_CHOICES[choice]
    else
      prompt("That's not a valid choice.")
    end
  end
end

def win?(first, second)
  WINNING_HANDS[first].include?(second)
end

def display_results(user, computer)
  if win?(user, computer)
    prompt('You won!')
  elsif win?(computer, user)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

clear
prompt("Welcome to Rock-Paper-Scissors-Lizard-Spock!!")
sleep(2)
prompt("First to win five rounds wins the match!!")
sleep(3)
clear

# ------------- MAIN BODY -----------
loop do
  computer_wins = 0
  user_wins = 0
  matches_played = 0

  loop do
    clear
    matches_played += 1
    prompt("Welcome to Round #{matches_played}")

    user_choice = retrieve_user_choice
    computer_choice = VALID_CHOICES.values.sample

    prompt("Player chose: #{user_choice} - Computer chose: #{computer_choice}.")

    display_results(user_choice, computer_choice)

    if win?(user_choice, computer_choice)
      user_wins += 1
    elsif win?(computer_choice, user_choice)
      computer_wins += 1
    end

    prompt("Score: Player: #{user_wins} --- Computer: #{computer_wins}")

    if user_wins == WIN_MATCH
      prompt("You won the match -- Congrats!!")
      sleep(3)
      break
    elsif computer_wins == WIN_MATCH
      prompt("The Computer has won the match -- Thank you for playing!")
      sleep(2)
      break
    end

    prompt('Ready for another round?')
    answer = gets.chomp
    break unless answer.downcase.start_with?('y') # fix this
  end
  prompt('Would you like to play another round of five against the computer?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
clear
prompt('Thank you for playing! Good bye!')
sleep(3)
clear
