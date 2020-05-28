WINNING_NUM = 21
DEALER_STAYS = 17
WAIT_TIME = 3

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []

  %w(Spade Diamond Heart Clubs).each do |suit|
    %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).each do |value|
      deck << [suit, value]
    end
  end
  deck
end

def total(cards)
  sum = 0
  values = cards.map { |card| card[1] }

  values.each do |value|
    sum += if value == 'Ace' then 11
           elsif value.to_i == 0 then 10
           else value.to_i
           end
  end

  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > WINNING_NUM
  end

  sum
end

def busted?(cards)
  total(cards) > WINNING_NUM
end

def detect_result(dealer_cards, player_cards)
  player_score = total(player_cards)
  dealer_score = total(dealer_cards)

  if player_score > 21
    :player_busted
  elsif dealer_score > 21
    :dealer_busted
  elsif player_score > dealer_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted!  You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_cards(player, computer)
  prompt "Dealer has #{computer[0][1]} and ???"
  prompt "You have #{player[0][1]} and #{player[1][1]}."
end

def play_again?
  puts "-----------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.downcase.chomp
  answer.start_with?('y')
end

# ------ main code ------

system 'clear'
prompt('Welcome to Twenty-One!!')
sleep WAIT_TIME

loop do
  system 'clear'
  deck = initialize_deck.shuffle!

  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  display_cards(player_cards, dealer_cards)

  sleep WAIT_TIME

  # player turn
  loop do
    prompt "Would you like to hit or stay? Type 'h' or 's'"
    answer = gets.downcase.chomp

    loop do
      break if answer.start_with?('h', 's')
      prompt "Invalid entry. Would you like to hit or stay? Type 'h' or 's'"
      answer = gets.downcase.chomp
    end

    break if answer.start_with?('s') || busted?(player_cards)

    prompt "You chose to hit!"
    sleep WAIT_TIME
    player_cards << deck.pop
    prompt "Your cards are now: #{player_cards}"
    prompt "Your total is now: #{total(player_cards)}"

    break if busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
    break
  else
    puts "You chose to stay at #{total(player_cards)}. " \
         "Now it is the dealer's turn."
    sleep WAIT_TIME
  end

  # dealer turn
  loop do
    break if total(dealer_cards) >= DEALER_STAYS

    prompt "Dealer Hits!"
    sleep WAIT_TIME
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break

  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  puts "=========================="
  prompt "Dealer has #{dealer_cards}, for a total of : #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of : #{total(player_cards)}"
  puts "=========================="

  display_result(dealer_cards, player_cards)
  sleep WAIT_TIME

  break unless play_again?
end

prompt "Thank you for playing Twenty One"
sleep WAIT_TIME
system 'clear'
