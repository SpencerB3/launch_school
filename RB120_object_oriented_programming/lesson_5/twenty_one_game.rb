require 'pry'

module Hand
  def total(cards)
    sum = 0
    values = cards.map { |card| card.value }

    values.each do |value|
      sum += value
    end

    values.select { |value| value == 11 }.count.times do
      sum -= 10 if sum > Game::WINNING_NUM
    end

    sum
  end

  def busted?

  end
end

class Participant
  # super class 
end

class Player
  include Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def hit
  end

  def stay

  end


  def <<(card)
    cards << card
  end

end

class Dealer
  include Hand
  attr_accessor :cards
  
  def initialize
    @cards = []
  end

  def hit


  end

  def stay

  end

  def <<(card)
    cards << card
  end

end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

end

class Card
  include Comparable
  attr_reader :rank, :suit

  HIGH_CARD_VALUES = { 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    HIGH_CARD_VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Game
  WINNING_NUM = 21
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new 
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    clear
    display_welcome_message
    deal_cards
    display_initial_cards
    player_turn
    dealer_turn
    display_result
    detect_winner
    display_winner
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One - Good bye"
  end

  def deal_cards
    2.times do
      player.cards << deck.draw
      dealer.cards << deck.draw
    end
  end

  def display_initial_cards
    puts "Dealer has #{dealer.cards.first} and ???"
    puts "You have #{player.cards.first} and #{player.cards.last}."
  end

  def player_turn
    answer = nil
    loop do
      puts "Would you like to hit or stay? Type 'h' or 's'"
      answer = gets.chomp.downcase
    
      loop do
        break if %w(h s).include?(answer)
        puts "Invalid answer.  Let's try again..."
        answer = gets.chomp.downcase
      end

      break if answer == 's'

      puts "You chose to hit!"
      player.cards << deck.draw
      puts "Your cards are now: #{player.cards.map(&:to_s).join(', ')}"
      puts "Your total is #{player.total(player.cards)}"
      break if busted?(player)
    end

    # player_turn_result
  end

  def busted?(participant)
    participant.total(participant.cards) > 21
  end

  # def display_player_cards
  #         binding.pry
    
  # end

  def dealer_turn
    loop do
      dealer.cards << deck.draw
      break if dealer.total(dealer.cards) >= 17
    end
  end

  def display_result
    puts "Your score is #{player.total(player.cards)}."
    puts "Dealer's score is #{dealer.total(dealer.cards)}."
  end

  def detect_winner
    if player.total(player.cards) > 21
      :player_busted
    elsif dealer.total(dealer.cards) > 21
      :dealer_busted
    elsif player.total(player.cards) > dealer.total(dealer.cards)
      :player_won
    elsif dealer.total(dealer.cards) > player.total(player.cards)
      :dealer_won
    else
      :tie
    end
  end

  def display_winner
    result = detect_winner

    case result
    when :player_busted
      puts "You busted! Dealer wins!"
    when :dealer_busted
      puts "Dealer busted!  You win!"
    when :player
      puts "You win!"
    when :dealer
      puts "Dealer wins!"
    when :tie
      puts "It's a tie!"
    end
  end

  def clear
    system 'clear'
  end

end

Game.new.start

