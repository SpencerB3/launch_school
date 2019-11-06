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

YES_ANSWERS = ['y', 'yes']

NO_ANSWERS = ['n', 'no']

WIN_MATCH = 5

ANOTHER_MATCH = <<-MSG
  Would you like to start another match against the computer?
  Please enter 'Y' or 'Yes' to play again, 'N' or 'No' to exit the program
MSG

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
      sleep(2)
      clear
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

def next_round(matches)
  prompt("Press ENTER to start round #{matches + 1}, 'Q' to quit")
  gets.chomp.downcase
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
  answer = ''

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
    sleep(1)

    if user_wins == WIN_MATCH
      clear
      prompt("You won the match -- CONGRATS!!")
      sleep(3)
      clear
      break
    elsif computer_wins == WIN_MATCH
      clear
      prompt("The Computer has won the match -- Thank you for playing!")
      sleep(3)
      break
    end

    answer = next_round(matches_played)
    break if answer == 'q'
    clear
  end

  loop do
    clear
    prompt(ANOTHER_MATCH)
    answer = gets.chomp.downcase
    break if YES_ANSWERS.include?(answer) || NO_ANSWERS.include?(answer)
    prompt("I didn't understand.  Let's try again.")
    sleep(2)
  end

  break unless YES_ANSWERS.include?(answer)
end

clear
prompt('Thank you for playing Rock-Paper-Scissors-Lizard-Spock!')
sleep(3)
clear
