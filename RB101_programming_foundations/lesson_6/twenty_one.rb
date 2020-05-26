WINNING_NUM = 21
DEALER_STAYS = 17
WAIT_TIME = 3

score = { 'player' => 0, 'computer' => 0 }

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

def display_cards(player, computer)

  prompt "Dealer has #{computer[0][1]} and an unknown card."
  prompt "You have #{player[0][1]} and #{player[1][1]}."

end

# ------ main code ------

prompt('Welcome to Twenty-One')

loop do
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
    # hit or stay, 
    # if stay, then break
    prompt ()


  end
  break


end



# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
