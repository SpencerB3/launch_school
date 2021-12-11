require 'pry'

module Hand
  def total
    sum = 0
    values = cards.map(&:value)

    values.each do |value|
      sum += value
    end

    values.select { |value| value == 11 }.count.times do
      sum -= 10 if sum > Game::WINNING_NUM
    end

    sum
  end

  def busted?
    total > Game::WINNING_NUM
  end

  def show_hand
    puts "** #{name}'s Hand **"
    cards.each do |card|
      puts card
    end
  end

  def add_card(new_card)
    cards << new_card
  end
end

class Participant
  include Hand
  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      print "Please enter your name: "
      name = gets.chomp.strip
      break unless name.empty? || Dealer::DEALER_NAMES.map(&:downcase)
                                                      .include?(name.downcase)
      invalid_name(name)
    end

    self.name = name
  end

  def show_flop
    show_hand
  end

  def invalid_name(name)
    if name.empty?
      puts "Please enter a value - let's try again..."
    elsif Dealer::DEALER_NAMES.map(&:downcase).include?(name.downcase)
      puts "Looks like #{name} is already taken - let's try again..."
    end                                                
  end
end

class Dealer < Participant
  DEALER_NAMES = ['Tom', 'Jerry', 'Bugs_Bunny', 'Sylvester_the_Cat']

  def set_name
    self.name = DEALER_NAMES.sample
  end

  def show_flop
    puts "** #{name}'s Hand **"
    puts cards.first.to_s
    puts "???"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    @cards.pop
  end
end

class Card
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
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
    clear
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    sleep(2)

    loop do
      deal_cards
      show_flop

      player_turn
      if player.busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end

      dealer_turn
      if dealer.busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end

      show_cards
      show_result
      play_again? ? reset : break
    end

    display_goodbye_message
  end

  def display_welcome_message
    clear
    puts "Welcome #{player.name} to Twenty-One!"
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One - Good bye"
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n yes no).include?(answer)
      puts "Invalid input - must use 'y' or 'n'. Let's try again."
    end

    answer == 'y' || answer == 'yes'
  end

  def show_busted
    if player.busted?
      puts "Looks like #{player.name} has busted! #{dealer.name} has won!"
    elsif dealer.busted
      puts "Looks like #{dealer.name} has busted! #{computer.name} has won!"
    end
  end

  def player_turn
    puts "It's #{player.name}'s turn..."

    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = nil

      loop do
        answer = gets.chomp.downcase.strip
        break if %w(h s).include?(answer)
        puts "Invalid answer; must be 'h' or 's'.  Let's try again..."
      end

      if answer == 's'
        puts "#{player.name} stays!"
        break
      elsif player.busted?
        break
      else
        player.add_card(deck.deal_one)
        puts "#{player.name} hits!"
        player.show_hand
        break if player.busted?
      end
    end
  end

  def dealer_turn
    print_dealers_turn

    loop do
      if dealer.total >= 17 || !dealer.busted?
        puts "Dealer stays!"
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer.add_card(deck.deal_one)
      end
    end
  end

  def print_dealers_turn
    puts "It's #{dealer.name}'s turn..."
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "#{player.name} has won!"
    elsif dealer.total > player.total
      puts "#{dealer.name} has won!"
    else
      puts "It's a tie!"
    end
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def clear
    system 'clear'
  end
end

Game.new.start
